import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import '../../domain/entities/book.dart';
import '../providers/create_book_providers.dart';
import '../../../shared/widgets/custom_text_field.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/loading_overlay.dart';
import '../../../shared/widgets/error_banner.dart';
import '../widgets/cover_image_picker.dart';
import '../widgets/author_input_field.dart';
import '../widgets/genre_input_field.dart';
import '../widgets/tag_input_field.dart';
import '../widgets/isbn_input_field.dart';

class CreateBookScreen extends ConsumerStatefulWidget {
  const CreateBookScreen({super.key});

  @override
  ConsumerState<CreateBookScreen> createState() => _CreateBookScreenState();
}

class _CreateBookScreenState extends ConsumerState<CreateBookScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  
  // Text controllers
  final _titleController = TextEditingController();
  final _subtitleController = TextEditingController();
  final _publisherController = TextEditingController();
  final _editionController = TextEditingController();
  final _pagesController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _setupControllerListeners();
  }

  void _setupControllerListeners() {
    _titleController.addListener(() {
      ref.read(createBookProvider.notifier).updateTitle(_titleController.text);
    });
    
    _subtitleController.addListener(() {
      ref.read(createBookProvider.notifier).updateSubtitle(_subtitleController.text);
    });
    
    _publisherController.addListener(() {
      ref.read(createBookProvider.notifier).updatePublisher(_publisherController.text);
    });
    
    _editionController.addListener(() {
      ref.read(createBookProvider.notifier).updateEdition(_editionController.text);
    });
    
    _pagesController.addListener(() {
      final pages = int.tryParse(_pagesController.text);
      ref.read(createBookProvider.notifier).updatePages(pages);
    });
    
    _descriptionController.addListener(() {
      ref.read(createBookProvider.notifier).updateDescription(_descriptionController.text);
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subtitleController.dispose();
    _publisherController.dispose();
    _editionController.dispose();
    _pagesController.dispose();
    _descriptionController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createBookProvider);
    final notifier = ref.read(createBookProvider.notifier);

    // Listen for success/error states
    ref.listen<CreateBookState>(createBookProvider, (previous, next) {
      if (next.isSuccess && next.createdBook != null) {
        _showSuccessDialog(next.createdBook!);
      } else if (next.failure != null) {
        _showErrorSnackBar(next.failure!);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Book'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.preview),
            onPressed: state.hasRequiredFields ? _showPreview : null,
            tooltip: 'Preview Book',
          ),
        ],
      ),
      body: LoadingOverlay(
        isLoading: state.isLoading,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Error banner
              if (state.failure != null)
                ErrorBanner(
                  message: state.failure!.message,
                  onDismiss: () => notifier.clearErrors(),
                ),
              
              // Form content
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Cover image section
                      _buildCoverImageSection(),
                      const SizedBox(height: 24),
                      
                      // Basic information section
                      _buildBasicInfoSection(),
                      const SizedBox(height: 24),
                      
                      // Publication details section
                      _buildPublicationSection(),
                      const SizedBox(height: 24),
                      
                      // Authors section
                      _buildAuthorsSection(),
                      const SizedBox(height: 24),
                      
                      // Genres section
                      _buildGenresSection(),
                      const SizedBox(height: 24),
                      
                      // Tags section
                      _buildTagsSection(),
                      const SizedBox(height: 24),
                      
                      // Description section
                      _buildDescriptionSection(),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
              
              // Bottom actions
              _buildBottomActions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoverImageSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Book Cover',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            CoverImagePicker(
              imagePath: ref.watch(createBookProvider.select((s) => s.coverImagePath)),
              imageUrl: ref.watch(createBookProvider.select((s) => s.coverImageUrl)),
              isUploading: ref.watch(createBookProvider.select((s) => s.isUploadingImage)),
              onImageSelected: (imagePath) {
                ref.read(createBookProvider.notifier).updateCoverImagePath(imagePath);
              },
              onImageUpload: (imagePath) {
                ref.read(createBookProvider.notifier).uploadCoverImage(imagePath);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicInfoSection() {
    final state = ref.watch(createBookProvider);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Basic Information',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            // Title (required)
            CustomTextField(
              controller: _titleController,
              label: 'Title',
              hint: 'Enter the book title',
              isRequired: true,
              errorText: state.fieldErrors?['title'],
              maxLength: 255,
            ),
            const SizedBox(height: 16),
            
            // Subtitle
            CustomTextField(
              controller: _subtitleController,
              label: 'Subtitle',
              hint: 'Enter the book subtitle (optional)',
              maxLength: 255,
            ),
            const SizedBox(height: 16),
            
            // ISBN fields
            Row(
              children: [
                Expanded(
                  child: ISBNInputField(
                    type: ISBNType.isbn10,
                    onChanged: (isbn) {
                      ref.read(createBookProvider.notifier).updateISBN10(isbn);
                    },
                    errorText: state.fieldErrors?['isbn10'],
                    isValid: state.isISBN10Valid,
                    isValidating: state.isValidating,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ISBNInputField(
                    type: ISBNType.isbn13,
                    onChanged: (isbn) {
                      ref.read(createBookProvider.notifier).updateISBN13(isbn);
                    },
                    errorText: state.fieldErrors?['isbn13'],
                    isValid: state.isISBN13Valid,
                    isValidating: state.isValidating,
                  ),
                ),
              ],
            ),
            
            // Duplicate warning
            if (state.isDuplicate)
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning,
                      color: Theme.of(context).colorScheme.error,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'A book with this ISBN or title already exists in your library.',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPublicationSection() {
    final state = ref.watch(createBookProvider);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Publication Details',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            // Publisher
            CustomTextField(
              controller: _publisherController,
              label: 'Publisher',
              hint: 'Enter the publisher name',
              prefixIcon: Icons.business,
            ),
            const SizedBox(height: 16),
            
            // Publication Date
            InkWell(
              onTap: () => _selectPublishedDate(context),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Publication Date',
                  hintText: 'Select publication date',
                  prefixIcon: const Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  state.publishedDate != null
                      ? DateFormat('MMM dd, yyyy').format(state.publishedDate!)
                      : 'Select date',
                  style: TextStyle(
                    color: state.publishedDate != null
                        ? Theme.of(context).textTheme.bodyLarge?.color
                        : Theme.of(context).hintColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Edition and Language
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _editionController,
                    label: 'Edition',
                    hint: 'e.g., 1st, 2nd',
                    prefixIcon: Icons.numbers,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: state.language,
                    decoration: InputDecoration(
                      labelText: 'Language',
                      prefixIcon: const Icon(Icons.language),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'en', child: Text('English')),
                      DropdownMenuItem(value: 'es', child: Text('Spanish')),
                      DropdownMenuItem(value: 'fr', child: Text('French')),
                      DropdownMenuItem(value: 'de', child: Text('German')),
                      DropdownMenuItem(value: 'it', child: Text('Italian')),
                      DropdownMenuItem(value: 'pt', child: Text('Portuguese')),
                      DropdownMenuItem(value: 'ja', child: Text('Japanese')),
                      DropdownMenuItem(value: 'ko', child: Text('Korean')),
                      DropdownMenuItem(value: 'zh', child: Text('Chinese')),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        ref.read(createBookProvider.notifier).updateLanguage(value);
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Pages and Format
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _pagesController,
                    label: 'Pages',
                    hint: 'Number of pages',
                    keyboardType: TextInputType.number,
                    prefixIcon: Icons.menu_book,
                    errorText: state.fieldErrors?['pages'],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<BookFormat>(
                    value: state.format,
                    decoration: InputDecoration(
                      labelText: 'Format',
                      prefixIcon: const Icon(Icons.book),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    items: BookFormat.values
                        .map((format) => DropdownMenuItem(
                              value: format,
                              child: Text(format.displayName),
                            ))
                        .toList(),
                    onChanged: (value) {
                      ref.read(createBookProvider.notifier).updateFormat(value);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthorsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Authors',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  '*',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
            if (ref.watch(createBookProvider.select((s) => s.fieldErrors?['authors'])) != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  ref.watch(createBookProvider.select((s) => s.fieldErrors!['authors']!)),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 12,
                  ),
                ),
              ),
            const SizedBox(height: 16),
            AuthorInputField(
              authors: ref.watch(createBookProvider.select((s) => s.authorNames)),
              suggestedAuthors: ref.watch(createBookProvider.select((s) => s.suggestedAuthors)),
              onAuthorAdded: (author) {
                ref.read(createBookProvider.notifier).addAuthor(author);
              },
              onAuthorRemoved: (author) {
                ref.read(createBookProvider.notifier).removeAuthor(author);
              },
              onSearchChanged: (query) {
                ref.read(createBookProvider.notifier).searchAuthors(query);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenresSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Genres',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            GenreInputField(
              genres: ref.watch(createBookProvider.select((s) => s.genreNames)),
              suggestedGenres: ref.watch(createBookProvider.select((s) => s.suggestedGenres)),
              onGenreAdded: (genre) {
                ref.read(createBookProvider.notifier).addGenre(genre);
              },
              onGenreRemoved: (genre) {
                ref.read(createBookProvider.notifier).removeGenre(genre);
              },
              onSearchChanged: (query) {
                ref.read(createBookProvider.notifier).searchGenres(query);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTagsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tags',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TagInputField(
              tags: ref.watch(createBookProvider.select((s) => s.tags)),
              onTagAdded: (tag) {
                ref.read(createBookProvider.notifier).addTag(tag);
              },
              onTagRemoved: (tag) {
                ref.read(createBookProvider.notifier).removeTag(tag);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _descriptionController,
              label: 'Book Description',
              hint: 'Enter a description of the book',
              maxLines: 5,
              maxLength: 2000,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomActions() {
    final state = ref.watch(createBookProvider);
    
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
              onPressed: () => _showResetConfirmation(context),
              child: const Text('Reset Form'),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: CustomButton(
              text: 'Add Book',
              onPressed: state.isFormValid ? _submitForm : null,
              isLoading: state.isLoading,
              icon: Icons.add,
            ),
          ),
        ],
      ),
    );
  }

  // Event handlers
  Future<void> _selectPublishedDate(BuildContext context) async {
    final currentDate = ref.read(createBookProvider).publishedDate ?? DateTime.now();
    
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1000),
      lastDate: DateTime.now(),
    );
    
    if (selectedDate != null) {
      ref.read(createBookProvider.notifier).updatePublishedDate(selectedDate);
    }
  }

  void _showPreview() {
    // Navigate to preview screen
    context.push('/books/create/preview');
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      ref.read(createBookProvider.notifier).createBook();
    }
  }

  void _showResetConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset Form'),
        content: const Text('Are you sure you want to reset the form? All entered data will be lost.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(createBookProvider.notifier).resetForm();
              _clearControllers();
            },
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }

  void _clearControllers() {
    _titleController.clear();
    _subtitleController.clear();
    _publisherController.clear();
    _editionController.clear();
    _pagesController.clear();
    _descriptionController.clear();
  }

  void _showSuccessDialog(Book book) {
    showDialog(
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
              _clearControllers();
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

  void _showErrorSnackBar(Failure failure) {
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
