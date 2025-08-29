import '../../data/models/author_model.dart';

/// Author entity representing an author in the domain layer
/// 
/// This is a pure domain object with no dependencies on external frameworks.
/// It represents the core business concept of an author.
class Author {
  final String id;
  final String name;
  final String? bio;
  final DateTime? birthDate;
  final DateTime? deathDate;
  final String? nationality;
  final String? image;
  final String? googleBooksId;
  final String? openLibraryId;
  final String? goodreadsId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Author({
    required this.id,
    required this.name,
    this.bio,
    this.birthDate,
    this.deathDate,
    this.nationality,
    this.image,
    this.googleBooksId,
    this.openLibraryId,
    this.goodreadsId,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Create an Author from an AuthorModel
  factory Author.fromModel(AuthorModel model) {
    return Author(
      id: model.id,
      name: model.name,
      bio: model.bio,
      birthDate: model.birthDate,
      deathDate: model.deathDate,
      nationality: model.nationality,
      image: model.image,
      googleBooksId: model.googleBooksId,
      openLibraryId: model.openLibraryId,
      goodreadsId: model.goodreadsId,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  /// Copy with method for creating modified instances
  Author copyWith({
    String? id,
    String? name,
    String? bio,
    DateTime? birthDate,
    DateTime? deathDate,
    String? nationality,
    String? image,
    String? googleBooksId,
    String? openLibraryId,
    String? goodreadsId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Author(
      id: id ?? this.id,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      birthDate: birthDate ?? this.birthDate,
      deathDate: deathDate ?? this.deathDate,
      nationality: nationality ?? this.nationality,
      image: image ?? this.image,
      googleBooksId: googleBooksId ?? this.googleBooksId,
      openLibraryId: openLibraryId ?? this.openLibraryId,
      goodreadsId: goodreadsId ?? this.goodreadsId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Get the display name for the author
  String get displayName => name;

  /// Get a formatted lifespan string
  String? get lifespan {
    if (birthDate == null) return null;
    
    final birth = birthDate!.year.toString();
    final death = deathDate?.year.toString() ?? 'present';
    
    return '$birth - $death';
  }

  /// Check if the author is still living
  bool get isLiving => deathDate == null;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    
    return other is Author && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Author{id: $id, name: $name, nationality: $nationality}';
  }
}
