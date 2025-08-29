import 'package:flutter/material.dart';

import '../../domain/entities/book.dart';

class AuthorInputField extends StatefulWidget {
  final List<String> authors;
  final List<Author> suggestedAuthors;
  final void Function(String) onAuthorAdded;
  final void Function(String) onAuthorRemoved;
  final void Function(String) onSearchChanged;

  const AuthorInputField({
    super.key,
    required this.authors,
    required this.suggestedAuthors,
    required this.onAuthorAdded,
    required this.onAuthorRemoved,
    required this.onSearchChanged,
  });

  @override
  State<AuthorInputField> createState() => _AuthorInputFieldState();
}

class _AuthorInputFieldState extends State<AuthorInputField> {
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
        // Author chips display
        if (widget.authors.isNotEmpty) ...[
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: widget.authors
                .map((author) => _buildAuthorChip(author))
                .toList(),
          ),
          const SizedBox(height: 12),
        ],

        // Author input field
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            labelText: 'Add Author',
            hintText: 'Type author name and press Enter',
            prefixIcon: const Icon(Icons.person_add),
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _addCurrentAuthor,
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
              _addAuthor(value.trim());
            }
          },
          textInputAction: TextInputAction.done,
        ),

        // Suggested authors dropdown
        if (_isExpanded && widget.suggestedAuthors.isNotEmpty) ...[
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
              itemCount: widget.suggestedAuthors.length,
              itemBuilder: (context, index) {
                final author = widget.suggestedAuthors[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: author.image != null
                        ? NetworkImage(author.image!)
                        : null,
                    child: author.image == null
                        ? Text(author.name.substring(0, 1).toUpperCase())
                        : null,
                  ),
                  title: Text(author.name),
                  subtitle: author.bio != null && author.bio!.isNotEmpty
                      ? Text(
                          author.bio!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      : null,
                  onTap: () {
                    _addAuthor(author.name);
                    _focusNode.unfocus();
                  },
                );
              },
            ),
          ),
        ],

        // Helper text
        const SizedBox(height: 8),
        Text(
          'Add at least one author. Press Enter or tap + to add each author.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildAuthorChip(String author) {
    return Chip(
      label: Text(author),
      deleteIcon: const Icon(Icons.close, size: 18),
      onDeleted: () => widget.onAuthorRemoved(author),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      labelStyle: TextStyle(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      side: BorderSide.none,
    );
  }

  void _addCurrentAuthor() {
    if (_controller.text.trim().isNotEmpty) {
      _addAuthor(_controller.text.trim());
    }
  }

  void _addAuthor(String authorName) {
    if (authorName.isNotEmpty && !widget.authors.contains(authorName)) {
      widget.onAuthorAdded(authorName);
      _controller.clear();
      widget.onSearchChanged('');
    }
  }
}
