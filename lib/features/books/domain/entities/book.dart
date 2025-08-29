import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class Book with _$Book {
  const factory Book({
    required String id,
    required String title,
    String? subtitle,
    String? isbn10,
    String? isbn13,
    String? publisher,
    DateTime? publishedDate,
    String? edition,
    @Default('en') String language,
    int? pages,
    String? format,
    @Default([]) List<String> genres,
    @Default([]) List<String> tags,
    String? description,
    String? coverImage,
    String? thumbnailUrl,
    String? previewUrl,
    String? googleBooksId,
    String? openLibraryId,
    String? goodreadsId,
    Map<String, dynamic>? metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default([]) List<Author> authors,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}

@freezed
class Author with _$Author {
  const factory Author({
    required String id,
    required String name,
    String? bio,
    DateTime? birthDate,
    DateTime? deathDate,
    String? nationality,
    String? image,
    String? googleBooksId,
    String? openLibraryId,
    String? goodreadsId,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? role,
  }) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}

@freezed
class Genre with _$Genre {
  const factory Genre({
    required String id,
    required String name,
    String? description,
    @Default('General') String category,
    String? color,
    @Default(0) int bookCount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@freezed
class CreateBookRequest with _$CreateBookRequest {
  const factory CreateBookRequest({
    required String title,
    String? subtitle,
    String? isbn10,
    String? isbn13,
    String? publisher,
    DateTime? publishedDate,
    String? edition,
    @Default('en') String language,
    int? pages,
    String? format,
    @Default([]) List<String> authorNames,
    @Default([]) List<String> genreNames,
    @Default([]) List<String> tags,
    String? description,
    String? coverImagePath,
  }) = _CreateBookRequest;

  factory CreateBookRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateBookRequestFromJson(json);
}

enum BookFormat {
  hardcover('Hardcover'),
  paperback('Paperback'),
  ebook('E-book'),
  audiobook('Audiobook');

  const BookFormat(this.displayName);
  final String displayName;
}
