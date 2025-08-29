// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
mixin _$Book {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String? get isbn10 => throw _privateConstructorUsedError;
  String? get isbn13 => throw _privateConstructorUsedError;
  String? get publisher => throw _privateConstructorUsedError;
  DateTime? get publishedDate => throw _privateConstructorUsedError;
  String? get edition => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  int? get pages => throw _privateConstructorUsedError;
  String? get format => throw _privateConstructorUsedError;
  List<String> get genres => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get coverImage => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  String? get previewUrl => throw _privateConstructorUsedError;
  String? get googleBooksId => throw _privateConstructorUsedError;
  String? get openLibraryId => throw _privateConstructorUsedError;
  String? get goodreadsId => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<Author> get authors => throw _privateConstructorUsedError;

  /// Serializes this Book to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Book
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call({
    String id,
    String title,
    String? subtitle,
    String? isbn10,
    String? isbn13,
    String? publisher,
    DateTime? publishedDate,
    String? edition,
    String language,
    int? pages,
    String? format,
    List<String> genres,
    List<String> tags,
    String? description,
    String? coverImage,
    String? thumbnailUrl,
    String? previewUrl,
    String? googleBooksId,
    String? openLibraryId,
    String? goodreadsId,
    Map<String, dynamic>? metadata,
    DateTime createdAt,
    DateTime updatedAt,
    List<Author> authors,
  });
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Book
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = freezed,
    Object? isbn10 = freezed,
    Object? isbn13 = freezed,
    Object? publisher = freezed,
    Object? publishedDate = freezed,
    Object? edition = freezed,
    Object? language = null,
    Object? pages = freezed,
    Object? format = freezed,
    Object? genres = null,
    Object? tags = null,
    Object? description = freezed,
    Object? coverImage = freezed,
    Object? thumbnailUrl = freezed,
    Object? previewUrl = freezed,
    Object? googleBooksId = freezed,
    Object? openLibraryId = freezed,
    Object? goodreadsId = freezed,
    Object? metadata = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? authors = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            subtitle: freezed == subtitle
                ? _value.subtitle
                : subtitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            isbn10: freezed == isbn10
                ? _value.isbn10
                : isbn10 // ignore: cast_nullable_to_non_nullable
                      as String?,
            isbn13: freezed == isbn13
                ? _value.isbn13
                : isbn13 // ignore: cast_nullable_to_non_nullable
                      as String?,
            publisher: freezed == publisher
                ? _value.publisher
                : publisher // ignore: cast_nullable_to_non_nullable
                      as String?,
            publishedDate: freezed == publishedDate
                ? _value.publishedDate
                : publishedDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            edition: freezed == edition
                ? _value.edition
                : edition // ignore: cast_nullable_to_non_nullable
                      as String?,
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
            pages: freezed == pages
                ? _value.pages
                : pages // ignore: cast_nullable_to_non_nullable
                      as int?,
            format: freezed == format
                ? _value.format
                : format // ignore: cast_nullable_to_non_nullable
                      as String?,
            genres: null == genres
                ? _value.genres
                : genres // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            coverImage: freezed == coverImage
                ? _value.coverImage
                : coverImage // ignore: cast_nullable_to_non_nullable
                      as String?,
            thumbnailUrl: freezed == thumbnailUrl
                ? _value.thumbnailUrl
                : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            previewUrl: freezed == previewUrl
                ? _value.previewUrl
                : previewUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            googleBooksId: freezed == googleBooksId
                ? _value.googleBooksId
                : googleBooksId // ignore: cast_nullable_to_non_nullable
                      as String?,
            openLibraryId: freezed == openLibraryId
                ? _value.openLibraryId
                : openLibraryId // ignore: cast_nullable_to_non_nullable
                      as String?,
            goodreadsId: freezed == goodreadsId
                ? _value.goodreadsId
                : goodreadsId // ignore: cast_nullable_to_non_nullable
                      as String?,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            authors: null == authors
                ? _value.authors
                : authors // ignore: cast_nullable_to_non_nullable
                      as List<Author>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookImplCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$BookImplCopyWith(
    _$BookImpl value,
    $Res Function(_$BookImpl) then,
  ) = __$$BookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String? subtitle,
    String? isbn10,
    String? isbn13,
    String? publisher,
    DateTime? publishedDate,
    String? edition,
    String language,
    int? pages,
    String? format,
    List<String> genres,
    List<String> tags,
    String? description,
    String? coverImage,
    String? thumbnailUrl,
    String? previewUrl,
    String? googleBooksId,
    String? openLibraryId,
    String? goodreadsId,
    Map<String, dynamic>? metadata,
    DateTime createdAt,
    DateTime updatedAt,
    List<Author> authors,
  });
}

/// @nodoc
class __$$BookImplCopyWithImpl<$Res>
    extends _$BookCopyWithImpl<$Res, _$BookImpl>
    implements _$$BookImplCopyWith<$Res> {
  __$$BookImplCopyWithImpl(_$BookImpl _value, $Res Function(_$BookImpl) _then)
    : super(_value, _then);

  /// Create a copy of Book
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = freezed,
    Object? isbn10 = freezed,
    Object? isbn13 = freezed,
    Object? publisher = freezed,
    Object? publishedDate = freezed,
    Object? edition = freezed,
    Object? language = null,
    Object? pages = freezed,
    Object? format = freezed,
    Object? genres = null,
    Object? tags = null,
    Object? description = freezed,
    Object? coverImage = freezed,
    Object? thumbnailUrl = freezed,
    Object? previewUrl = freezed,
    Object? googleBooksId = freezed,
    Object? openLibraryId = freezed,
    Object? goodreadsId = freezed,
    Object? metadata = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? authors = null,
  }) {
    return _then(
      _$BookImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        subtitle: freezed == subtitle
            ? _value.subtitle
            : subtitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        isbn10: freezed == isbn10
            ? _value.isbn10
            : isbn10 // ignore: cast_nullable_to_non_nullable
                  as String?,
        isbn13: freezed == isbn13
            ? _value.isbn13
            : isbn13 // ignore: cast_nullable_to_non_nullable
                  as String?,
        publisher: freezed == publisher
            ? _value.publisher
            : publisher // ignore: cast_nullable_to_non_nullable
                  as String?,
        publishedDate: freezed == publishedDate
            ? _value.publishedDate
            : publishedDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        edition: freezed == edition
            ? _value.edition
            : edition // ignore: cast_nullable_to_non_nullable
                  as String?,
        language: null == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String,
        pages: freezed == pages
            ? _value.pages
            : pages // ignore: cast_nullable_to_non_nullable
                  as int?,
        format: freezed == format
            ? _value.format
            : format // ignore: cast_nullable_to_non_nullable
                  as String?,
        genres: null == genres
            ? _value._genres
            : genres // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        coverImage: freezed == coverImage
            ? _value.coverImage
            : coverImage // ignore: cast_nullable_to_non_nullable
                  as String?,
        thumbnailUrl: freezed == thumbnailUrl
            ? _value.thumbnailUrl
            : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        previewUrl: freezed == previewUrl
            ? _value.previewUrl
            : previewUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        googleBooksId: freezed == googleBooksId
            ? _value.googleBooksId
            : googleBooksId // ignore: cast_nullable_to_non_nullable
                  as String?,
        openLibraryId: freezed == openLibraryId
            ? _value.openLibraryId
            : openLibraryId // ignore: cast_nullable_to_non_nullable
                  as String?,
        goodreadsId: freezed == goodreadsId
            ? _value.goodreadsId
            : goodreadsId // ignore: cast_nullable_to_non_nullable
                  as String?,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        authors: null == authors
            ? _value._authors
            : authors // ignore: cast_nullable_to_non_nullable
                  as List<Author>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BookImpl implements _Book {
  const _$BookImpl({
    required this.id,
    required this.title,
    this.subtitle,
    this.isbn10,
    this.isbn13,
    this.publisher,
    this.publishedDate,
    this.edition,
    this.language = 'en',
    this.pages,
    this.format,
    final List<String> genres = const [],
    final List<String> tags = const [],
    this.description,
    this.coverImage,
    this.thumbnailUrl,
    this.previewUrl,
    this.googleBooksId,
    this.openLibraryId,
    this.goodreadsId,
    final Map<String, dynamic>? metadata,
    required this.createdAt,
    required this.updatedAt,
    final List<Author> authors = const [],
  }) : _genres = genres,
       _tags = tags,
       _metadata = metadata,
       _authors = authors;

  factory _$BookImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? subtitle;
  @override
  final String? isbn10;
  @override
  final String? isbn13;
  @override
  final String? publisher;
  @override
  final DateTime? publishedDate;
  @override
  final String? edition;
  @override
  @JsonKey()
  final String language;
  @override
  final int? pages;
  @override
  final String? format;
  final List<String> _genres;
  @override
  @JsonKey()
  List<String> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String? description;
  @override
  final String? coverImage;
  @override
  final String? thumbnailUrl;
  @override
  final String? previewUrl;
  @override
  final String? googleBooksId;
  @override
  final String? openLibraryId;
  @override
  final String? goodreadsId;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  final List<Author> _authors;
  @override
  @JsonKey()
  List<Author> get authors {
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authors);
  }

  @override
  String toString() {
    return 'Book(id: $id, title: $title, subtitle: $subtitle, isbn10: $isbn10, isbn13: $isbn13, publisher: $publisher, publishedDate: $publishedDate, edition: $edition, language: $language, pages: $pages, format: $format, genres: $genres, tags: $tags, description: $description, coverImage: $coverImage, thumbnailUrl: $thumbnailUrl, previewUrl: $previewUrl, googleBooksId: $googleBooksId, openLibraryId: $openLibraryId, goodreadsId: $goodreadsId, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt, authors: $authors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.isbn10, isbn10) || other.isbn10 == isbn10) &&
            (identical(other.isbn13, isbn13) || other.isbn13 == isbn13) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.publishedDate, publishedDate) ||
                other.publishedDate == publishedDate) &&
            (identical(other.edition, edition) || other.edition == edition) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.format, format) || other.format == format) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.previewUrl, previewUrl) ||
                other.previewUrl == previewUrl) &&
            (identical(other.googleBooksId, googleBooksId) ||
                other.googleBooksId == googleBooksId) &&
            (identical(other.openLibraryId, openLibraryId) ||
                other.openLibraryId == openLibraryId) &&
            (identical(other.goodreadsId, goodreadsId) ||
                other.goodreadsId == goodreadsId) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._authors, _authors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    title,
    subtitle,
    isbn10,
    isbn13,
    publisher,
    publishedDate,
    edition,
    language,
    pages,
    format,
    const DeepCollectionEquality().hash(_genres),
    const DeepCollectionEquality().hash(_tags),
    description,
    coverImage,
    thumbnailUrl,
    previewUrl,
    googleBooksId,
    openLibraryId,
    goodreadsId,
    const DeepCollectionEquality().hash(_metadata),
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(_authors),
  ]);

  /// Create a copy of Book
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      __$$BookImplCopyWithImpl<_$BookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookImplToJson(this);
  }
}

abstract class _Book implements Book {
  const factory _Book({
    required final String id,
    required final String title,
    final String? subtitle,
    final String? isbn10,
    final String? isbn13,
    final String? publisher,
    final DateTime? publishedDate,
    final String? edition,
    final String language,
    final int? pages,
    final String? format,
    final List<String> genres,
    final List<String> tags,
    final String? description,
    final String? coverImage,
    final String? thumbnailUrl,
    final String? previewUrl,
    final String? googleBooksId,
    final String? openLibraryId,
    final String? goodreadsId,
    final Map<String, dynamic>? metadata,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final List<Author> authors,
  }) = _$BookImpl;

  factory _Book.fromJson(Map<String, dynamic> json) = _$BookImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String? get isbn10;
  @override
  String? get isbn13;
  @override
  String? get publisher;
  @override
  DateTime? get publishedDate;
  @override
  String? get edition;
  @override
  String get language;
  @override
  int? get pages;
  @override
  String? get format;
  @override
  List<String> get genres;
  @override
  List<String> get tags;
  @override
  String? get description;
  @override
  String? get coverImage;
  @override
  String? get thumbnailUrl;
  @override
  String? get previewUrl;
  @override
  String? get googleBooksId;
  @override
  String? get openLibraryId;
  @override
  String? get goodreadsId;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  List<Author> get authors;

  /// Create a copy of Book
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return _Author.fromJson(json);
}

/// @nodoc
mixin _$Author {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  DateTime? get birthDate => throw _privateConstructorUsedError;
  DateTime? get deathDate => throw _privateConstructorUsedError;
  String? get nationality => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get googleBooksId => throw _privateConstructorUsedError;
  String? get openLibraryId => throw _privateConstructorUsedError;
  String? get goodreadsId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;

  /// Serializes this Author to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Author
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthorCopyWith<Author> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorCopyWith<$Res> {
  factory $AuthorCopyWith(Author value, $Res Function(Author) then) =
      _$AuthorCopyWithImpl<$Res, Author>;
  @useResult
  $Res call({
    String id,
    String name,
    String? bio,
    DateTime? birthDate,
    DateTime? deathDate,
    String? nationality,
    String? image,
    String? googleBooksId,
    String? openLibraryId,
    String? goodreadsId,
    DateTime createdAt,
    DateTime updatedAt,
    String? role,
  });
}

/// @nodoc
class _$AuthorCopyWithImpl<$Res, $Val extends Author>
    implements $AuthorCopyWith<$Res> {
  _$AuthorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Author
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? bio = freezed,
    Object? birthDate = freezed,
    Object? deathDate = freezed,
    Object? nationality = freezed,
    Object? image = freezed,
    Object? googleBooksId = freezed,
    Object? openLibraryId = freezed,
    Object? goodreadsId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? role = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            bio: freezed == bio
                ? _value.bio
                : bio // ignore: cast_nullable_to_non_nullable
                      as String?,
            birthDate: freezed == birthDate
                ? _value.birthDate
                : birthDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            deathDate: freezed == deathDate
                ? _value.deathDate
                : deathDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            nationality: freezed == nationality
                ? _value.nationality
                : nationality // ignore: cast_nullable_to_non_nullable
                      as String?,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            googleBooksId: freezed == googleBooksId
                ? _value.googleBooksId
                : googleBooksId // ignore: cast_nullable_to_non_nullable
                      as String?,
            openLibraryId: freezed == openLibraryId
                ? _value.openLibraryId
                : openLibraryId // ignore: cast_nullable_to_non_nullable
                      as String?,
            goodreadsId: freezed == goodreadsId
                ? _value.goodreadsId
                : goodreadsId // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            role: freezed == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AuthorImplCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$$AuthorImplCopyWith(
    _$AuthorImpl value,
    $Res Function(_$AuthorImpl) then,
  ) = __$$AuthorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? bio,
    DateTime? birthDate,
    DateTime? deathDate,
    String? nationality,
    String? image,
    String? googleBooksId,
    String? openLibraryId,
    String? goodreadsId,
    DateTime createdAt,
    DateTime updatedAt,
    String? role,
  });
}

/// @nodoc
class __$$AuthorImplCopyWithImpl<$Res>
    extends _$AuthorCopyWithImpl<$Res, _$AuthorImpl>
    implements _$$AuthorImplCopyWith<$Res> {
  __$$AuthorImplCopyWithImpl(
    _$AuthorImpl _value,
    $Res Function(_$AuthorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Author
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? bio = freezed,
    Object? birthDate = freezed,
    Object? deathDate = freezed,
    Object? nationality = freezed,
    Object? image = freezed,
    Object? googleBooksId = freezed,
    Object? openLibraryId = freezed,
    Object? goodreadsId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? role = freezed,
  }) {
    return _then(
      _$AuthorImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        bio: freezed == bio
            ? _value.bio
            : bio // ignore: cast_nullable_to_non_nullable
                  as String?,
        birthDate: freezed == birthDate
            ? _value.birthDate
            : birthDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        deathDate: freezed == deathDate
            ? _value.deathDate
            : deathDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        nationality: freezed == nationality
            ? _value.nationality
            : nationality // ignore: cast_nullable_to_non_nullable
                  as String?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        googleBooksId: freezed == googleBooksId
            ? _value.googleBooksId
            : googleBooksId // ignore: cast_nullable_to_non_nullable
                  as String?,
        openLibraryId: freezed == openLibraryId
            ? _value.openLibraryId
            : openLibraryId // ignore: cast_nullable_to_non_nullable
                  as String?,
        goodreadsId: freezed == goodreadsId
            ? _value.goodreadsId
            : goodreadsId // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        role: freezed == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthorImpl implements _Author {
  const _$AuthorImpl({
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
    this.role,
  });

  factory _$AuthorImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? bio;
  @override
  final DateTime? birthDate;
  @override
  final DateTime? deathDate;
  @override
  final String? nationality;
  @override
  final String? image;
  @override
  final String? googleBooksId;
  @override
  final String? openLibraryId;
  @override
  final String? goodreadsId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? role;

  @override
  String toString() {
    return 'Author(id: $id, name: $name, bio: $bio, birthDate: $birthDate, deathDate: $deathDate, nationality: $nationality, image: $image, googleBooksId: $googleBooksId, openLibraryId: $openLibraryId, goodreadsId: $goodreadsId, createdAt: $createdAt, updatedAt: $updatedAt, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.deathDate, deathDate) ||
                other.deathDate == deathDate) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.googleBooksId, googleBooksId) ||
                other.googleBooksId == googleBooksId) &&
            (identical(other.openLibraryId, openLibraryId) ||
                other.openLibraryId == openLibraryId) &&
            (identical(other.goodreadsId, goodreadsId) ||
                other.goodreadsId == goodreadsId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    bio,
    birthDate,
    deathDate,
    nationality,
    image,
    googleBooksId,
    openLibraryId,
    goodreadsId,
    createdAt,
    updatedAt,
    role,
  );

  /// Create a copy of Author
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorImplCopyWith<_$AuthorImpl> get copyWith =>
      __$$AuthorImplCopyWithImpl<_$AuthorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorImplToJson(this);
  }
}

abstract class _Author implements Author {
  const factory _Author({
    required final String id,
    required final String name,
    final String? bio,
    final DateTime? birthDate,
    final DateTime? deathDate,
    final String? nationality,
    final String? image,
    final String? googleBooksId,
    final String? openLibraryId,
    final String? goodreadsId,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final String? role,
  }) = _$AuthorImpl;

  factory _Author.fromJson(Map<String, dynamic> json) = _$AuthorImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get bio;
  @override
  DateTime? get birthDate;
  @override
  DateTime? get deathDate;
  @override
  String? get nationality;
  @override
  String? get image;
  @override
  String? get googleBooksId;
  @override
  String? get openLibraryId;
  @override
  String? get goodreadsId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String? get role;

  /// Create a copy of Author
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthorImplCopyWith<_$AuthorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return _Genre.fromJson(json);
}

/// @nodoc
mixin _$Genre {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  int get bookCount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Genre to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenreCopyWith<Genre> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreCopyWith<$Res> {
  factory $GenreCopyWith(Genre value, $Res Function(Genre) then) =
      _$GenreCopyWithImpl<$Res, Genre>;
  @useResult
  $Res call({
    String id,
    String name,
    String? description,
    String category,
    String? color,
    int bookCount,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$GenreCopyWithImpl<$Res, $Val extends Genre>
    implements $GenreCopyWith<$Res> {
  _$GenreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? category = null,
    Object? color = freezed,
    Object? bookCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            color: freezed == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as String?,
            bookCount: null == bookCount
                ? _value.bookCount
                : bookCount // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GenreImplCopyWith<$Res> implements $GenreCopyWith<$Res> {
  factory _$$GenreImplCopyWith(
    _$GenreImpl value,
    $Res Function(_$GenreImpl) then,
  ) = __$$GenreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? description,
    String category,
    String? color,
    int bookCount,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$GenreImplCopyWithImpl<$Res>
    extends _$GenreCopyWithImpl<$Res, _$GenreImpl>
    implements _$$GenreImplCopyWith<$Res> {
  __$$GenreImplCopyWithImpl(
    _$GenreImpl _value,
    $Res Function(_$GenreImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? category = null,
    Object? color = freezed,
    Object? bookCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$GenreImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        color: freezed == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as String?,
        bookCount: null == bookCount
            ? _value.bookCount
            : bookCount // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GenreImpl implements _Genre {
  const _$GenreImpl({
    required this.id,
    required this.name,
    this.description,
    this.category = 'General',
    this.color,
    this.bookCount = 0,
    required this.createdAt,
    required this.updatedAt,
  });

  factory _$GenreImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenreImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey()
  final String category;
  @override
  final String? color;
  @override
  @JsonKey()
  final int bookCount;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Genre(id: $id, name: $name, description: $description, category: $category, color: $color, bookCount: $bookCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenreImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.bookCount, bookCount) ||
                other.bookCount == bookCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    category,
    color,
    bookCount,
    createdAt,
    updatedAt,
  );

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenreImplCopyWith<_$GenreImpl> get copyWith =>
      __$$GenreImplCopyWithImpl<_$GenreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenreImplToJson(this);
  }
}

abstract class _Genre implements Genre {
  const factory _Genre({
    required final String id,
    required final String name,
    final String? description,
    final String category,
    final String? color,
    final int bookCount,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$GenreImpl;

  factory _Genre.fromJson(Map<String, dynamic> json) = _$GenreImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  String get category;
  @override
  String? get color;
  @override
  int get bookCount;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenreImplCopyWith<_$GenreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateBookRequest _$CreateBookRequestFromJson(Map<String, dynamic> json) {
  return _CreateBookRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateBookRequest {
  String get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String? get isbn10 => throw _privateConstructorUsedError;
  String? get isbn13 => throw _privateConstructorUsedError;
  String? get publisher => throw _privateConstructorUsedError;
  DateTime? get publishedDate => throw _privateConstructorUsedError;
  String? get edition => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  int? get pages => throw _privateConstructorUsedError;
  String? get format => throw _privateConstructorUsedError;
  List<String> get authorNames => throw _privateConstructorUsedError;
  List<String> get genreNames => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get coverImagePath => throw _privateConstructorUsedError;

  /// Serializes this CreateBookRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateBookRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateBookRequestCopyWith<CreateBookRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBookRequestCopyWith<$Res> {
  factory $CreateBookRequestCopyWith(
    CreateBookRequest value,
    $Res Function(CreateBookRequest) then,
  ) = _$CreateBookRequestCopyWithImpl<$Res, CreateBookRequest>;
  @useResult
  $Res call({
    String title,
    String? subtitle,
    String? isbn10,
    String? isbn13,
    String? publisher,
    DateTime? publishedDate,
    String? edition,
    String language,
    int? pages,
    String? format,
    List<String> authorNames,
    List<String> genreNames,
    List<String> tags,
    String? description,
    String? coverImagePath,
  });
}

/// @nodoc
class _$CreateBookRequestCopyWithImpl<$Res, $Val extends CreateBookRequest>
    implements $CreateBookRequestCopyWith<$Res> {
  _$CreateBookRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateBookRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = freezed,
    Object? isbn10 = freezed,
    Object? isbn13 = freezed,
    Object? publisher = freezed,
    Object? publishedDate = freezed,
    Object? edition = freezed,
    Object? language = null,
    Object? pages = freezed,
    Object? format = freezed,
    Object? authorNames = null,
    Object? genreNames = null,
    Object? tags = null,
    Object? description = freezed,
    Object? coverImagePath = freezed,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            subtitle: freezed == subtitle
                ? _value.subtitle
                : subtitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            isbn10: freezed == isbn10
                ? _value.isbn10
                : isbn10 // ignore: cast_nullable_to_non_nullable
                      as String?,
            isbn13: freezed == isbn13
                ? _value.isbn13
                : isbn13 // ignore: cast_nullable_to_non_nullable
                      as String?,
            publisher: freezed == publisher
                ? _value.publisher
                : publisher // ignore: cast_nullable_to_non_nullable
                      as String?,
            publishedDate: freezed == publishedDate
                ? _value.publishedDate
                : publishedDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            edition: freezed == edition
                ? _value.edition
                : edition // ignore: cast_nullable_to_non_nullable
                      as String?,
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
            pages: freezed == pages
                ? _value.pages
                : pages // ignore: cast_nullable_to_non_nullable
                      as int?,
            format: freezed == format
                ? _value.format
                : format // ignore: cast_nullable_to_non_nullable
                      as String?,
            authorNames: null == authorNames
                ? _value.authorNames
                : authorNames // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            genreNames: null == genreNames
                ? _value.genreNames
                : genreNames // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            coverImagePath: freezed == coverImagePath
                ? _value.coverImagePath
                : coverImagePath // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateBookRequestImplCopyWith<$Res>
    implements $CreateBookRequestCopyWith<$Res> {
  factory _$$CreateBookRequestImplCopyWith(
    _$CreateBookRequestImpl value,
    $Res Function(_$CreateBookRequestImpl) then,
  ) = __$$CreateBookRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String? subtitle,
    String? isbn10,
    String? isbn13,
    String? publisher,
    DateTime? publishedDate,
    String? edition,
    String language,
    int? pages,
    String? format,
    List<String> authorNames,
    List<String> genreNames,
    List<String> tags,
    String? description,
    String? coverImagePath,
  });
}

/// @nodoc
class __$$CreateBookRequestImplCopyWithImpl<$Res>
    extends _$CreateBookRequestCopyWithImpl<$Res, _$CreateBookRequestImpl>
    implements _$$CreateBookRequestImplCopyWith<$Res> {
  __$$CreateBookRequestImplCopyWithImpl(
    _$CreateBookRequestImpl _value,
    $Res Function(_$CreateBookRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateBookRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = freezed,
    Object? isbn10 = freezed,
    Object? isbn13 = freezed,
    Object? publisher = freezed,
    Object? publishedDate = freezed,
    Object? edition = freezed,
    Object? language = null,
    Object? pages = freezed,
    Object? format = freezed,
    Object? authorNames = null,
    Object? genreNames = null,
    Object? tags = null,
    Object? description = freezed,
    Object? coverImagePath = freezed,
  }) {
    return _then(
      _$CreateBookRequestImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        subtitle: freezed == subtitle
            ? _value.subtitle
            : subtitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        isbn10: freezed == isbn10
            ? _value.isbn10
            : isbn10 // ignore: cast_nullable_to_non_nullable
                  as String?,
        isbn13: freezed == isbn13
            ? _value.isbn13
            : isbn13 // ignore: cast_nullable_to_non_nullable
                  as String?,
        publisher: freezed == publisher
            ? _value.publisher
            : publisher // ignore: cast_nullable_to_non_nullable
                  as String?,
        publishedDate: freezed == publishedDate
            ? _value.publishedDate
            : publishedDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        edition: freezed == edition
            ? _value.edition
            : edition // ignore: cast_nullable_to_non_nullable
                  as String?,
        language: null == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String,
        pages: freezed == pages
            ? _value.pages
            : pages // ignore: cast_nullable_to_non_nullable
                  as int?,
        format: freezed == format
            ? _value.format
            : format // ignore: cast_nullable_to_non_nullable
                  as String?,
        authorNames: null == authorNames
            ? _value._authorNames
            : authorNames // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        genreNames: null == genreNames
            ? _value._genreNames
            : genreNames // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        coverImagePath: freezed == coverImagePath
            ? _value.coverImagePath
            : coverImagePath // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateBookRequestImpl implements _CreateBookRequest {
  const _$CreateBookRequestImpl({
    required this.title,
    this.subtitle,
    this.isbn10,
    this.isbn13,
    this.publisher,
    this.publishedDate,
    this.edition,
    this.language = 'en',
    this.pages,
    this.format,
    final List<String> authorNames = const [],
    final List<String> genreNames = const [],
    final List<String> tags = const [],
    this.description,
    this.coverImagePath,
  }) : _authorNames = authorNames,
       _genreNames = genreNames,
       _tags = tags;

  factory _$CreateBookRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateBookRequestImplFromJson(json);

  @override
  final String title;
  @override
  final String? subtitle;
  @override
  final String? isbn10;
  @override
  final String? isbn13;
  @override
  final String? publisher;
  @override
  final DateTime? publishedDate;
  @override
  final String? edition;
  @override
  @JsonKey()
  final String language;
  @override
  final int? pages;
  @override
  final String? format;
  final List<String> _authorNames;
  @override
  @JsonKey()
  List<String> get authorNames {
    if (_authorNames is EqualUnmodifiableListView) return _authorNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authorNames);
  }

  final List<String> _genreNames;
  @override
  @JsonKey()
  List<String> get genreNames {
    if (_genreNames is EqualUnmodifiableListView) return _genreNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genreNames);
  }

  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String? description;
  @override
  final String? coverImagePath;

  @override
  String toString() {
    return 'CreateBookRequest(title: $title, subtitle: $subtitle, isbn10: $isbn10, isbn13: $isbn13, publisher: $publisher, publishedDate: $publishedDate, edition: $edition, language: $language, pages: $pages, format: $format, authorNames: $authorNames, genreNames: $genreNames, tags: $tags, description: $description, coverImagePath: $coverImagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBookRequestImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.isbn10, isbn10) || other.isbn10 == isbn10) &&
            (identical(other.isbn13, isbn13) || other.isbn13 == isbn13) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.publishedDate, publishedDate) ||
                other.publishedDate == publishedDate) &&
            (identical(other.edition, edition) || other.edition == edition) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.format, format) || other.format == format) &&
            const DeepCollectionEquality().equals(
              other._authorNames,
              _authorNames,
            ) &&
            const DeepCollectionEquality().equals(
              other._genreNames,
              _genreNames,
            ) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.coverImagePath, coverImagePath) ||
                other.coverImagePath == coverImagePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    subtitle,
    isbn10,
    isbn13,
    publisher,
    publishedDate,
    edition,
    language,
    pages,
    format,
    const DeepCollectionEquality().hash(_authorNames),
    const DeepCollectionEquality().hash(_genreNames),
    const DeepCollectionEquality().hash(_tags),
    description,
    coverImagePath,
  );

  /// Create a copy of CreateBookRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBookRequestImplCopyWith<_$CreateBookRequestImpl> get copyWith =>
      __$$CreateBookRequestImplCopyWithImpl<_$CreateBookRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateBookRequestImplToJson(this);
  }
}

abstract class _CreateBookRequest implements CreateBookRequest {
  const factory _CreateBookRequest({
    required final String title,
    final String? subtitle,
    final String? isbn10,
    final String? isbn13,
    final String? publisher,
    final DateTime? publishedDate,
    final String? edition,
    final String language,
    final int? pages,
    final String? format,
    final List<String> authorNames,
    final List<String> genreNames,
    final List<String> tags,
    final String? description,
    final String? coverImagePath,
  }) = _$CreateBookRequestImpl;

  factory _CreateBookRequest.fromJson(Map<String, dynamic> json) =
      _$CreateBookRequestImpl.fromJson;

  @override
  String get title;
  @override
  String? get subtitle;
  @override
  String? get isbn10;
  @override
  String? get isbn13;
  @override
  String? get publisher;
  @override
  DateTime? get publishedDate;
  @override
  String? get edition;
  @override
  String get language;
  @override
  int? get pages;
  @override
  String? get format;
  @override
  List<String> get authorNames;
  @override
  List<String> get genreNames;
  @override
  List<String> get tags;
  @override
  String? get description;
  @override
  String? get coverImagePath;

  /// Create a copy of CreateBookRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateBookRequestImplCopyWith<_$CreateBookRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
