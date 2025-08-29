import 'package:flutter/material.dart';

import '../../domain/entities/book.dart';

class GenreInputField extends StatefulWidget {
  final List<String> genres;
  final List<Genre> suggestedGenres;
  final void Function(String) onGenreAdded;
  final void Function(String) onGenreRemoved;
  final void Function(String) onSearchChanged;

  const GenreInputField({
    super.key,
    required this.genres,
    required this.suggestedGenres,
    required this.onGenreAdded,
    required this.onGenreRemoved,
    required this.onSearchChanged,
  });

  @override
  State<GenreInputField> createState() => _GenreInputFieldState();
}

class _GenreInputFieldState extends State<GenreInputField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isExpanded = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Genre chips display
        if (widget.genres.isNotEmpty) ...[
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: widget.genres
                .map((genre) => _buildGenreChip(genre))
                .toList(),
          ),
          const SizedBox(height: 12),
        ],

        // Genre input field
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            labelText: 'Add Genre',
            hintText: 'Type genre name and press Enter',
            prefixIcon: const Icon(Icons.category),
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _addCurrentGenre,
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onChanged: (value) {
            widget.onSearchChanged(value);
          },
          onSubmitted: (value) {
            if (value.trim().isNotEmpty) {
              _addGenre(value.trim());
            }
          },
          textInputAction: TextInputAction.done,
        ),

        // Suggested genres dropdown
        if (_isExpanded && widget.suggestedGenres.isNotEmpty) ...[
          const SizedBox(height: 8),
          Container(
            constraints: const BoxConstraints(maxHeight: 200),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
              ),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.suggestedGenres.length,
              itemBuilder: (context, index) {
                final genre = widget.suggestedGenres[index];
                return ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: _getGenreColor(genre.name),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getGenreIcon(genre.name),
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  title: Text(genre.name),
                  subtitle: genre.description != null && genre.description!.isNotEmpty
                      ? Text(
                          genre.description!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      : null,
                  onTap: () {
                    _addGenre(genre.name);
                    _focusNode.unfocus();
                  },
                );
              },
            ),
          ),
        ],

        // Popular genres chips
        if (!_isExpanded && widget.genres.isEmpty) ...[
          const SizedBox(height: 12),
          Text(
            'Popular genres:',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: _getPopularGenres()
                .map((genre) => _buildSuggestedGenreChip(genre))
                .toList(),
          ),
        ],

        // Helper text
        const SizedBox(height: 8),
        Text(
          'Add genres to help categorize your book. Press Enter or tap + to add each genre.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildGenreChip(String genre) {
    return Chip(
      label: Text(genre),
      deleteIcon: const Icon(Icons.close, size: 18),
      onDeleted: () => widget.onGenreRemoved(genre),
      backgroundColor: _getGenreColor(genre).withOpacity(0.2),
      labelStyle: TextStyle(
        color: _getGenreColor(genre),
        fontWeight: FontWeight.w500,
      ),
      side: BorderSide(color: _getGenreColor(genre)),
    );
  }

  Widget _buildSuggestedGenreChip(String genre) {
    return ActionChip(
      label: Text(genre),
      onPressed: () => _addGenre(genre),
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      labelStyle: TextStyle(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      side: BorderSide.none,
    );
  }

  void _addCurrentGenre() {
    if (_controller.text.trim().isNotEmpty) {
      _addGenre(_controller.text.trim());
    }
  }

  void _addGenre(String genreName) {
    if (genreName.isNotEmpty && !widget.genres.contains(genreName)) {
      widget.onGenreAdded(genreName);
      _controller.clear();
      widget.onSearchChanged('');
    }
  }

  List<String> _getPopularGenres() {
    return [
      'Fiction',
      'Non-Fiction',
      'Mystery',
      'Romance',
      'Science Fiction',
      'Fantasy',
      'Biography',
      'History',
      'Self-Help',
      'Cooking',
      'Travel',
      'Children',
    ];
  }

  Color _getGenreColor(String genre) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
      Colors.amber,
      Colors.cyan,
      Colors.deepOrange,
      Colors.lightGreen,
      Colors.deepPurple,
    ];
    
    final hash = genre.hashCode;
    return colors[hash.abs() % colors.length];
  }

  IconData _getGenreIcon(String genre) {
    final lowerGenre = genre.toLowerCase();
    
    if (lowerGenre.contains('fiction') || lowerGenre.contains('novel')) {
      return Icons.auto_stories;
    } else if (lowerGenre.contains('science')) {
      return Icons.science;
    } else if (lowerGenre.contains('history')) {
      return Icons.history_edu;
    } else if (lowerGenre.contains('biography')) {
      return Icons.person;
    } else if (lowerGenre.contains('romance')) {
      return Icons.favorite;
    } else if (lowerGenre.contains('mystery') || lowerGenre.contains('crime')) {
      return Icons.search;
    } else if (lowerGenre.contains('fantasy') || lowerGenre.contains('magic')) {
      return Icons.auto_fix_high;
    } else if (lowerGenre.contains('children') || lowerGenre.contains('kids')) {
      return Icons.child_care;
    } else if (lowerGenre.contains('cooking') || lowerGenre.contains('recipe')) {
      return Icons.restaurant;
    } else if (lowerGenre.contains('travel')) {
      return Icons.flight;
    } else if (lowerGenre.contains('self-help') || lowerGenre.contains('motivation')) {
      return Icons.psychology;
    } else {
      return Icons.category;
    }
  }
}
