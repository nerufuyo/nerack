import 'author_model.dart';

/// Book data model for API serialization
/// 
/// This model handles the conversion between JSON data from the API
/// and the Book domain entity.
class BookModel {
  final String id;
  final String title;
  final String? subtitle;
  final String? isbn10;
  final String? isbn13;
  final String? publisher;
  final DateTime? publishedDate;
  final String? edition;
  final String language;
  final int? pages;
  final String? format;
  final List<String> genres;
  final List<String> tags;
  final String? description;
  final String? coverImage;
  final String? thumbnailUrl;
  final String? previewUrl;
  final String? googleBooksId;
  final String? openLibraryId;
  final String? goodreadsId;
  final Map<String, dynamic>? metadata;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<BookAuthorModel> authors;

  const BookModel({
    required this.id,
    required this.title,
    this.subtitle,
    this.isbn10,
    this.isbn13,
    this.publisher,
    this.publishedDate,
    this.edition,
    required this.language,
    this.pages,
    this.format,
    required this.genres,
    required this.tags,
    this.description,
    this.coverImage,
    this.thumbnailUrl,
    this.previewUrl,
    this.googleBooksId,
    this.openLibraryId,
    this.goodreadsId,
    this.metadata,
    required this.createdAt,
    required this.updatedAt,
    required this.authors,
  });

  /// Create BookModel from JSON
  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
      isbn10: json['isbn10'] as String?,
      isbn13: json['isbn13'] as String?,
      publisher: json['publisher'] as String?,
      publishedDate: json['publishedDate'] != null 
          ? DateTime.parse(json['publishedDate'] as String)
          : null,
      edition: json['edition'] as String?,
      language: json['language'] as String? ?? 'en',
      pages: (json['pages'] as num?)?.toInt(),
      format: json['format'] as String?,
      genres: List<String>.from(json['genres'] as List? ?? []),
      tags: List<String>.from(json['tags'] as List? ?? []),
      description: json['description'] as String?,
      coverImage: json['coverImage'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      previewUrl: json['previewUrl'] as String?,
      googleBooksId: json['googleBooksId'] as String?,
      openLibraryId: json['openLibraryId'] as String?,
      goodreadsId: json['goodreadsId'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      authors: (json['authors'] as List?)
          ?.map((e) => BookAuthorModel.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
    );
  }

  /// Convert BookModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      if (isbn10 != null) 'isbn10': isbn10,
      if (isbn13 != null) 'isbn13': isbn13,
      if (publisher != null) 'publisher': publisher,
      if (publishedDate != null) 'publishedDate': publishedDate!.toIso8601String(),
      if (edition != null) 'edition': edition,
      'language': language,
      if (pages != null) 'pages': pages,
      if (format != null) 'format': format,
      'genres': genres,
      'tags': tags,
      if (description != null) 'description': description,
      if (coverImage != null) 'coverImage': coverImage,
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
      if (previewUrl != null) 'previewUrl': previewUrl,
      if (googleBooksId != null) 'googleBooksId': googleBooksId,
      if (openLibraryId != null) 'openLibraryId': openLibraryId,
      if (goodreadsId != null) 'goodreadsId': goodreadsId,
      if (metadata != null) 'metadata': metadata,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'authors': authors.map((e) => e.toJson()).toList(),
    };
  }

  /// Copy with method for creating modified instances
  BookModel copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? isbn10,
    String? isbn13,
    String? publisher,
    DateTime? publishedDate,
    String? edition,
    String? language,
    int? pages,
    String? format,
    List<String>? genres,
    List<String>? tags,
    String? description,
    String? coverImage,
    String? thumbnailUrl,
    String? previewUrl,
    String? googleBooksId,
    String? openLibraryId,
    String? goodreadsId,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<BookAuthorModel>? authors,
  }) {
    return BookModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isbn10: isbn10 ?? this.isbn10,
      isbn13: isbn13 ?? this.isbn13,
      publisher: publisher ?? this.publisher,
      publishedDate: publishedDate ?? this.publishedDate,
      edition: edition ?? this.edition,
      language: language ?? this.language,
      pages: pages ?? this.pages,
      format: format ?? this.format,
      genres: genres ?? this.genres,
      tags: tags ?? this.tags,
      description: description ?? this.description,
      coverImage: coverImage ?? this.coverImage,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      previewUrl: previewUrl ?? this.previewUrl,
      googleBooksId: googleBooksId ?? this.googleBooksId,
      openLibraryId: openLibraryId ?? this.openLibraryId,
      goodreadsId: goodreadsId ?? this.goodreadsId,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      authors: authors ?? this.authors,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    
    return other is BookModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'BookModel{id: $id, title: $title, language: $language}';
  }
}

/// Book-Author relationship model
class BookAuthorModel {
  final String id;
  final String role;
  final AuthorModel author;

  const BookAuthorModel({
    required this.id,
    required this.role,
    required this.author,
  });

  /// Create BookAuthorModel from JSON
  factory BookAuthorModel.fromJson(Map<String, dynamic> json) {
    return BookAuthorModel(
      id: json['id'] as String,
      role: json['role'] as String,
      author: AuthorModel.fromJson(json['author'] as Map<String, dynamic>),
    );
  }

  /// Convert BookAuthorModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role': role,
      'author': author.toJson(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    
    return other is BookAuthorModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'BookAuthorModel{id: $id, role: $role, author: ${author.name}}';
  }
}
