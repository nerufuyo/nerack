import '../../data/models/genre_model.dart';

/// Genre entity representing a book genre/category in the domain layer
/// 
/// This is a pure domain object with no dependencies on external frameworks.
/// It represents the core business concept of a book genre.
class Genre {
  final String id;
  final String name;
  final String? description;
  final String category;
  final String? color;
  final int bookCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Genre({
    required this.id,
    required this.name,
    this.description,
    required this.category,
    this.color,
    required this.bookCount,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Create a Genre from a GenreModel
  factory Genre.fromModel(GenreModel model) {
    return Genre(
      id: model.id,
      name: model.name,
      description: model.description,
      category: model.category,
      color: model.color,
      bookCount: model.bookCount,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  /// Copy with method for creating modified instances
  Genre copyWith({
    String? id,
    String? name,
    String? description,
    String? category,
    String? color,
    int? bookCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Genre(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      color: color ?? this.color,
      bookCount: bookCount ?? this.bookCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Get the display name for the genre
  String get displayName => name;

  /// Check if this is a popular genre (has many books)
  bool get isPopular => bookCount >= 10;

  /// Get a formatted description
  String get formattedDescription {
    if (description != null && description!.isNotEmpty) {
      return description!;
    }
    return 'Books in the $name category';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    
    return other is Genre && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Genre{id: $id, name: $name, category: $category, bookCount: $bookCount}';
  }
}
