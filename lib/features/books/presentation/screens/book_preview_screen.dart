import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import '../../domain/entities/book.dart';
import '../providers/create_book_providers.dart';
import '../providers/create_book_state.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/loading_overlay.dart';
import '../../../../core/error/failures.dart';

class BookPreviewScreen extends ConsumerWidget {
  const BookPreviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createBookProvider);
    final notifier = ref.read(createBookProvider.notifier);

    // Listen for success/error states
    ref.listen<CreateBookState>(createBookProvider, (previous, next) {
      if (next.isSuccess && next.createdBook != null) {
        _showSuccessDialog(context, ref, next.createdBook!);
      } else if (next.failure != null) {
        _showErrorSnackBar(context, next.failure!);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Book'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.pop(),
            tooltip: 'Edit Book',
          ),
        ],
      ),
      body: LoadingOverlay(
        isLoading: state.isLoading,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Book header with cover and basic info
              _buildBookHeader(context, state),
              const SizedBox(height: 24),
              
              // Book details sections
              _buildBookDetails(context, state),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomActions(context, state, notifier, ref),
    );
  }

  Widget _buildBookHeader(BuildContext context, CreateBookState state) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Book cover
            Container(
              width: 120,
              height: 180,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: _buildCoverImage(state),
              ),
            ),
            const SizedBox(width: 16),
            
            // Basic info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    state.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  // Subtitle
                  if (state.subtitle.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      state.subtitle,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  
                  const SizedBox(height: 12),
                  
                  // Authors
                  if (state.authorNames.isNotEmpty) ...[
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 16,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            state.authorNames.join(', '),
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                  
                  // Publisher and date
                  if (state.publisher.isNotEmpty) ...[
                    Row(
                      children: [
                        Icon(
                          Icons.business,
                          size: 16,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            state.publisher,
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                  
                  // Publication date
                  if (state.publishedDate != null) ...[
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          DateFormat('MMM dd, yyyy').format(state.publishedDate!),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoverImage(CreateBookState state) {
    if (state.coverImagePath != null && state.coverImagePath!.isNotEmpty) {
      return Image.file(
        File(state.coverImagePath!),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
      );
    }

    if (state.coverImageUrl != null && state.coverImageUrl!.isNotEmpty) {
      return Image.network(
        state.coverImageUrl!,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
      );
    }

    return _buildPlaceholder();
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey[200],
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.book, size: 48, color: Colors.grey),
          SizedBox(height: 8),
          Text('No Cover', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildBookDetails(BuildContext context, CreateBookState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ISBN Section
        if (state.isbn10.isNotEmpty || state.isbn13.isNotEmpty)
          _buildDetailSection(
            context,
            'ISBN Information',
            Icons.qr_code,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.isbn10.isNotEmpty)
                  _buildDetailRow('ISBN-10', state.isbn10),
                if (state.isbn13.isNotEmpty)
                  _buildDetailRow('ISBN-13', state.isbn13),
              ],
            ),
          ),

        // Publication Details
        _buildDetailSection(
          context,
          'Publication Details',
          Icons.menu_book,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state.edition.isNotEmpty)
                _buildDetailRow('Edition', state.edition),
              _buildDetailRow('Language', _getLanguageName(state.language)),
              if (state.pages != null)
                _buildDetailRow('Pages', state.pages!.toString()),
              if (state.format != null)
                _buildDetailRow('Format', state.format!.displayName),
            ],
          ),
        ),

        // Genres
        if (state.genreNames.isNotEmpty)
          _buildDetailSection(
            context,
            'Genres',
            Icons.category,
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: state.genreNames
                  .map((genre) => Chip(
                        label: Text(genre),
                        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ))
                  .toList(),
            ),
          ),

        // Tags
        if (state.tags.isNotEmpty)
          _buildDetailSection(
            context,
            'Tags',
            Icons.label,
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: state.tags
                  .map((tag) => Chip(
                        label: Text(tag),
                        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondaryContainer,
                        ),
                      ))
                  .toList(),
            ),
          ),

        // Description
        if (state.description.isNotEmpty)
          _buildDetailSection(
            context,
            'Description',
            Icons.description,
            Text(
              state.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
      ],
    );
  }

  Widget _buildDetailSection(
    BuildContext context,
    String title,
    IconData icon,
    Widget content,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions(
    BuildContext context,
    CreateBookState state,
    CreateBookNotifier notifier,
    WidgetRef ref,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: state.isLoading ? null : () => context.pop(),
              child: const Text('Back to Edit'),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: CustomButton(
              text: 'Add Book',
              onPressed: ref.read(createBookProvider.notifier).isFormValid && !state.isLoading 
                  ? () => notifier.createBook() : null,
              isLoading: state.isLoading,
              icon: Icons.add,
            ),
          ),
        ],
      ),
    );
  }

  String _getLanguageName(String code) {
    const languageMap = {
      'en': 'English',
      'es': 'Spanish',
      'fr': 'French',
      'de': 'German',
      'it': 'Italian',
      'pt': 'Portuguese',
      'ja': 'Japanese',
      'ko': 'Korean',
      'zh': 'Chinese',
    };
    return languageMap[code] ?? code.toUpperCase();
  }

  void _showSuccessDialog(BuildContext context, WidgetRef ref, Book book) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.check_circle, color: Colors.green, size: 48),
        title: const Text('Book Added Successfully!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${book.title} has been added to your library.'),
            const SizedBox(height: 16),
            Text(
              'What would you like to do next?',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(createBookProvider.notifier).resetForm();
              // Navigate back to create form
              context.go('/books/create');
            },
            child: const Text('Add Another Book'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.go('/books/${book.id}');
            },
            child: const Text('View Book'),
          ),
        ],
      ),
    );
  }

  void _showErrorSnackBar(BuildContext context, Failure failure) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(failure.message),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}
