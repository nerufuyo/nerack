import 'package:flutter/material.dart';

class TagInputField extends StatefulWidget {
  final List<String> tags;
  final void Function(String) onTagAdded;
  final void Function(String) onTagRemoved;

  const TagInputField({
    super.key,
    required this.tags,
    required this.onTagAdded,
    required this.onTagRemoved,
  });

  @override
  State<TagInputField> createState() => _TagInputFieldState();
}

class _TagInputFieldState extends State<TagInputField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tag chips display
        if (widget.tags.isNotEmpty) ...[
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: widget.tags
                .map((tag) => _buildTagChip(tag))
                .toList(),
          ),
          const SizedBox(height: 12),
        ],

        // Tag input field
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'Add Tag',
            hintText: 'Type tag and press Enter',
            prefixIcon: const Icon(Icons.label),
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _addCurrentTag,
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onSubmitted: (value) {
            if (value.trim().isNotEmpty) {
              _addTag(value.trim());
            }
          },
          textInputAction: TextInputAction.done,
          textCapitalization: TextCapitalization.words,
        ),

        // Popular tags suggestions
        if (widget.tags.isEmpty) ...[
          const SizedBox(height: 12),
          Text(
            'Popular tags:',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: _getPopularTags()
                .map((tag) => _buildSuggestedTagChip(tag))
                .toList(),
          ),
        ],

        // Helper text
        const SizedBox(height: 8),
        Text(
          'Add tags to help organize and search your books. Press Enter or tap + to add each tag.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildTagChip(String tag) {
    return Chip(
      label: Text(tag),
      deleteIcon: const Icon(Icons.close, size: 18),
      onDeleted: () => widget.onTagRemoved(tag),
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      labelStyle: TextStyle(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
      side: BorderSide.none,
    );
  }

  Widget _buildSuggestedTagChip(String tag) {
    return ActionChip(
      label: Text(tag),
      onPressed: () => _addTag(tag),
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      labelStyle: TextStyle(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      side: BorderSide.none,
    );
  }

  void _addCurrentTag() {
    if (_controller.text.trim().isNotEmpty) {
      _addTag(_controller.text.trim());
    }
  }

  void _addTag(String tagName) {
    // Normalize tag (lowercase, trim)
    final normalizedTag = tagName.trim().toLowerCase();
    
    if (normalizedTag.isNotEmpty && 
        !widget.tags.map((t) => t.toLowerCase()).contains(normalizedTag)) {
      // Add with original case for display
      widget.onTagAdded(tagName.trim());
      _controller.clear();
    }
  }

  List<String> _getPopularTags() {
    return [
      'To Read',
      'Favorite',
      'Recommended',
      'Award Winner',
      'Classic',
      'New Release',
      'Book Club',
      'Must Read',
      'Page Turner',
      'Educational',
      'Inspirational',
      'Thought Provoking',
    ];
  }
}
