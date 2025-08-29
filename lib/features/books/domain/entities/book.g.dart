// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  subtitle: json['subtitle'] as String?,
  isbn10: json['isbn10'] as String?,
  isbn13: json['isbn13'] as String?,
  publisher: json['publisher'] as String?,
  publishedDate: json['publishedDate'] == null
      ? null
      : DateTime.parse(json['publishedDate'] as String),
  edition: json['edition'] as String?,
  language: json['language'] as String? ?? 'en',
  pages: (json['pages'] as num?)?.toInt(),
  format: json['format'] as String?,
  genres:
      (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
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
  authors:
      (json['authors'] as List<dynamic>?)
          ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'isbn10': instance.isbn10,
      'isbn13': instance.isbn13,
      'publisher': instance.publisher,
      'publishedDate': instance.publishedDate?.toIso8601String(),
      'edition': instance.edition,
      'language': instance.language,
      'pages': instance.pages,
      'format': instance.format,
      'genres': instance.genres,
      'tags': instance.tags,
      'description': instance.description,
      'coverImage': instance.coverImage,
      'thumbnailUrl': instance.thumbnailUrl,
      'previewUrl': instance.previewUrl,
      'googleBooksId': instance.googleBooksId,
      'openLibraryId': instance.openLibraryId,
      'goodreadsId': instance.goodreadsId,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'authors': instance.authors,
    };

_$AuthorImpl _$$AuthorImplFromJson(Map<String, dynamic> json) => _$AuthorImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  bio: json['bio'] as String?,
  birthDate: json['birthDate'] == null
      ? null
      : DateTime.parse(json['birthDate'] as String),
  deathDate: json['deathDate'] == null
      ? null
      : DateTime.parse(json['deathDate'] as String),
  nationality: json['nationality'] as String?,
  image: json['image'] as String?,
  googleBooksId: json['googleBooksId'] as String?,
  openLibraryId: json['openLibraryId'] as String?,
  goodreadsId: json['goodreadsId'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  role: json['role'] as String?,
);

Map<String, dynamic> _$$AuthorImplToJson(_$AuthorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bio': instance.bio,
      'birthDate': instance.birthDate?.toIso8601String(),
      'deathDate': instance.deathDate?.toIso8601String(),
      'nationality': instance.nationality,
      'image': instance.image,
      'googleBooksId': instance.googleBooksId,
      'openLibraryId': instance.openLibraryId,
      'goodreadsId': instance.goodreadsId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'role': instance.role,
    };

_$GenreImpl _$$GenreImplFromJson(Map<String, dynamic> json) => _$GenreImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  category: json['category'] as String? ?? 'General',
  color: json['color'] as String?,
  bookCount: (json['bookCount'] as num?)?.toInt() ?? 0,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$GenreImplToJson(_$GenreImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'color': instance.color,
      'bookCount': instance.bookCount,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$CreateBookRequestImpl _$$CreateBookRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreateBookRequestImpl(
  title: json['title'] as String,
  subtitle: json['subtitle'] as String?,
  isbn10: json['isbn10'] as String?,
  isbn13: json['isbn13'] as String?,
  publisher: json['publisher'] as String?,
  publishedDate: json['publishedDate'] == null
      ? null
      : DateTime.parse(json['publishedDate'] as String),
  edition: json['edition'] as String?,
  language: json['language'] as String? ?? 'en',
  pages: (json['pages'] as num?)?.toInt(),
  format: json['format'] as String?,
  authorNames:
      (json['authorNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  genreNames:
      (json['genreNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  description: json['description'] as String?,
  coverImagePath: json['coverImagePath'] as String?,
);

Map<String, dynamic> _$$CreateBookRequestImplToJson(
  _$CreateBookRequestImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'subtitle': instance.subtitle,
  'isbn10': instance.isbn10,
  'isbn13': instance.isbn13,
  'publisher': instance.publisher,
  'publishedDate': instance.publishedDate?.toIso8601String(),
  'edition': instance.edition,
  'language': instance.language,
  'pages': instance.pages,
  'format': instance.format,
  'authorNames': instance.authorNames,
  'genreNames': instance.genreNames,
  'tags': instance.tags,
  'description': instance.description,
  'coverImagePath': instance.coverImagePath,
};
