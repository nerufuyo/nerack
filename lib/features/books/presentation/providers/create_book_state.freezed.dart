// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_book_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CreateBookState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isValidating => throw _privateConstructorUsedError;
  bool get isUploadingImage => throw _privateConstructorUsedError; // Form data
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  String get isbn10 => throw _privateConstructorUsedError;
  String get isbn13 => throw _privateConstructorUsedError;
  String get publisher => throw _privateConstructorUsedError;
  DateTime? get publishedDate => throw _privateConstructorUsedError;
  String get edition => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  int? get pages => throw _privateConstructorUsedError;
  BookFormat? get format => throw _privateConstructorUsedError;
  List<String> get authorNames => throw _privateConstructorUsedError;
  List<String> get genreNames => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get coverImagePath => throw _privateConstructorUsedError;
  String? get coverImageUrl =>
      throw _privateConstructorUsedError; // Available options
  List<Author> get suggestedAuthors => throw _privateConstructorUsedError;
  List<Genre> get suggestedGenres =>
      throw _privateConstructorUsedError; // Validation
  Map<String, String>? get fieldErrors => throw _privateConstructorUsedError;
  bool get isISBN10Valid => throw _privateConstructorUsedError;
  bool get isISBN13Valid => throw _privateConstructorUsedError;
  bool get isDuplicate =>
      throw _privateConstructorUsedError; // Success/Error states
  Book? get createdBook => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;

  /// Create a copy of CreateBookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateBookStateCopyWith<CreateBookState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBookStateCopyWith<$Res> {
  factory $CreateBookStateCopyWith(
    CreateBookState value,
    $Res Function(CreateBookState) then,
  ) = _$CreateBookStateCopyWithImpl<$Res, CreateBookState>;
  @useResult
  $Res call({
    bool isLoading,
    bool isValidating,
    bool isUploadingImage,
    String title,
    String subtitle,
    String isbn10,
    String isbn13,
    String publisher,
    DateTime? publishedDate,
    String edition,
    String language,
    int? pages,
    BookFormat? format,
    List<String> authorNames,
    List<String> genreNames,
    List<String> tags,
    String description,
    String? coverImagePath,
    String? coverImageUrl,
    List<Author> suggestedAuthors,
    List<Genre> suggestedGenres,
    Map<String, String>? fieldErrors,
    bool isISBN10Valid,
    bool isISBN13Valid,
    bool isDuplicate,
    Book? createdBook,
    Failure? failure,
    bool isSuccess,
  });
}

/// @nodoc
class _$CreateBookStateCopyWithImpl<$Res, $Val extends CreateBookState>
    implements $CreateBookStateCopyWith<$Res> {
  _$CreateBookStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateBookState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isValidating = null,
    Object? isUploadingImage = null,
    Object? title = null,
    Object? subtitle = null,
    Object? isbn10 = null,
    Object? isbn13 = null,
    Object? publisher = null,
    Object? publishedDate = freezed,
    Object? edition = null,
    Object? language = null,
    Object? pages = freezed,
    Object? format = freezed,
    Object? authorNames = null,
    Object? genreNames = null,
    Object? tags = null,
    Object? description = null,
    Object? coverImagePath = freezed,
    Object? coverImageUrl = freezed,
    Object? suggestedAuthors = null,
    Object? suggestedGenres = null,
    Object? fieldErrors = freezed,
    Object? isISBN10Valid = null,
    Object? isISBN13Valid = null,
    Object? isDuplicate = null,
    Object? createdBook = freezed,
    Object? failure = freezed,
    Object? isSuccess = null,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isValidating: null == isValidating
                ? _value.isValidating
                : isValidating // ignore: cast_nullable_to_non_nullable
                      as bool,
            isUploadingImage: null == isUploadingImage
                ? _value.isUploadingImage
                : isUploadingImage // ignore: cast_nullable_to_non_nullable
                      as bool,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            subtitle: null == subtitle
                ? _value.subtitle
                : subtitle // ignore: cast_nullable_to_non_nullable
                      as String,
            isbn10: null == isbn10
                ? _value.isbn10
                : isbn10 // ignore: cast_nullable_to_non_nullable
                      as String,
            isbn13: null == isbn13
                ? _value.isbn13
                : isbn13 // ignore: cast_nullable_to_non_nullable
                      as String,
            publisher: null == publisher
                ? _value.publisher
                : publisher // ignore: cast_nullable_to_non_nullable
                      as String,
            publishedDate: freezed == publishedDate
                ? _value.publishedDate
                : publishedDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            edition: null == edition
                ? _value.edition
                : edition // ignore: cast_nullable_to_non_nullable
                      as String,
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
                      as BookFormat?,
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
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            coverImagePath: freezed == coverImagePath
                ? _value.coverImagePath
                : coverImagePath // ignore: cast_nullable_to_non_nullable
                      as String?,
            coverImageUrl: freezed == coverImageUrl
                ? _value.coverImageUrl
                : coverImageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            suggestedAuthors: null == suggestedAuthors
                ? _value.suggestedAuthors
                : suggestedAuthors // ignore: cast_nullable_to_non_nullable
                      as List<Author>,
            suggestedGenres: null == suggestedGenres
                ? _value.suggestedGenres
                : suggestedGenres // ignore: cast_nullable_to_non_nullable
                      as List<Genre>,
            fieldErrors: freezed == fieldErrors
                ? _value.fieldErrors
                : fieldErrors // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>?,
            isISBN10Valid: null == isISBN10Valid
                ? _value.isISBN10Valid
                : isISBN10Valid // ignore: cast_nullable_to_non_nullable
                      as bool,
            isISBN13Valid: null == isISBN13Valid
                ? _value.isISBN13Valid
                : isISBN13Valid // ignore: cast_nullable_to_non_nullable
                      as bool,
            isDuplicate: null == isDuplicate
                ? _value.isDuplicate
                : isDuplicate // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdBook: freezed == createdBook
                ? _value.createdBook
                : createdBook // ignore: cast_nullable_to_non_nullable
                      as Book?,
            failure: freezed == failure
                ? _value.failure
                : failure // ignore: cast_nullable_to_non_nullable
                      as Failure?,
            isSuccess: null == isSuccess
                ? _value.isSuccess
                : isSuccess // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateBookStateImplCopyWith<$Res>
    implements $CreateBookStateCopyWith<$Res> {
  factory _$$CreateBookStateImplCopyWith(
    _$CreateBookStateImpl value,
    $Res Function(_$CreateBookStateImpl) then,
  ) = __$$CreateBookStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    bool isValidating,
    bool isUploadingImage,
    String title,
    String subtitle,
    String isbn10,
    String isbn13,
    String publisher,
    DateTime? publishedDate,
    String edition,
    String language,
    int? pages,
    BookFormat? format,
    List<String> authorNames,
    List<String> genreNames,
    List<String> tags,
    String description,
    String? coverImagePath,
    String? coverImageUrl,
    List<Author> suggestedAuthors,
    List<Genre> suggestedGenres,
    Map<String, String>? fieldErrors,
    bool isISBN10Valid,
    bool isISBN13Valid,
    bool isDuplicate,
    Book? createdBook,
    Failure? failure,
    bool isSuccess,
  });
}

/// @nodoc
class __$$CreateBookStateImplCopyWithImpl<$Res>
    extends _$CreateBookStateCopyWithImpl<$Res, _$CreateBookStateImpl>
    implements _$$CreateBookStateImplCopyWith<$Res> {
  __$$CreateBookStateImplCopyWithImpl(
    _$CreateBookStateImpl _value,
    $Res Function(_$CreateBookStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateBookState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isValidating = null,
    Object? isUploadingImage = null,
    Object? title = null,
    Object? subtitle = null,
    Object? isbn10 = null,
    Object? isbn13 = null,
    Object? publisher = null,
    Object? publishedDate = freezed,
    Object? edition = null,
    Object? language = null,
    Object? pages = freezed,
    Object? format = freezed,
    Object? authorNames = null,
    Object? genreNames = null,
    Object? tags = null,
    Object? description = null,
    Object? coverImagePath = freezed,
    Object? coverImageUrl = freezed,
    Object? suggestedAuthors = null,
    Object? suggestedGenres = null,
    Object? fieldErrors = freezed,
    Object? isISBN10Valid = null,
    Object? isISBN13Valid = null,
    Object? isDuplicate = null,
    Object? createdBook = freezed,
    Object? failure = freezed,
    Object? isSuccess = null,
  }) {
    return _then(
      _$CreateBookStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isValidating: null == isValidating
            ? _value.isValidating
            : isValidating // ignore: cast_nullable_to_non_nullable
                  as bool,
        isUploadingImage: null == isUploadingImage
            ? _value.isUploadingImage
            : isUploadingImage // ignore: cast_nullable_to_non_nullable
                  as bool,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        subtitle: null == subtitle
            ? _value.subtitle
            : subtitle // ignore: cast_nullable_to_non_nullable
                  as String,
        isbn10: null == isbn10
            ? _value.isbn10
            : isbn10 // ignore: cast_nullable_to_non_nullable
                  as String,
        isbn13: null == isbn13
            ? _value.isbn13
            : isbn13 // ignore: cast_nullable_to_non_nullable
                  as String,
        publisher: null == publisher
            ? _value.publisher
            : publisher // ignore: cast_nullable_to_non_nullable
                  as String,
        publishedDate: freezed == publishedDate
            ? _value.publishedDate
            : publishedDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        edition: null == edition
            ? _value.edition
            : edition // ignore: cast_nullable_to_non_nullable
                  as String,
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
                  as BookFormat?,
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
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        coverImagePath: freezed == coverImagePath
            ? _value.coverImagePath
            : coverImagePath // ignore: cast_nullable_to_non_nullable
                  as String?,
        coverImageUrl: freezed == coverImageUrl
            ? _value.coverImageUrl
            : coverImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        suggestedAuthors: null == suggestedAuthors
            ? _value._suggestedAuthors
            : suggestedAuthors // ignore: cast_nullable_to_non_nullable
                  as List<Author>,
        suggestedGenres: null == suggestedGenres
            ? _value._suggestedGenres
            : suggestedGenres // ignore: cast_nullable_to_non_nullable
                  as List<Genre>,
        fieldErrors: freezed == fieldErrors
            ? _value._fieldErrors
            : fieldErrors // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>?,
        isISBN10Valid: null == isISBN10Valid
            ? _value.isISBN10Valid
            : isISBN10Valid // ignore: cast_nullable_to_non_nullable
                  as bool,
        isISBN13Valid: null == isISBN13Valid
            ? _value.isISBN13Valid
            : isISBN13Valid // ignore: cast_nullable_to_non_nullable
                  as bool,
        isDuplicate: null == isDuplicate
            ? _value.isDuplicate
            : isDuplicate // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdBook: freezed == createdBook
            ? _value.createdBook
            : createdBook // ignore: cast_nullable_to_non_nullable
                  as Book?,
        failure: freezed == failure
            ? _value.failure
            : failure // ignore: cast_nullable_to_non_nullable
                  as Failure?,
        isSuccess: null == isSuccess
            ? _value.isSuccess
            : isSuccess // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$CreateBookStateImpl implements _CreateBookState {
  const _$CreateBookStateImpl({
    this.isLoading = false,
    this.isValidating = false,
    this.isUploadingImage = false,
    this.title = '',
    this.subtitle = '',
    this.isbn10 = '',
    this.isbn13 = '',
    this.publisher = '',
    this.publishedDate,
    this.edition = '',
    this.language = 'en',
    this.pages,
    this.format,
    final List<String> authorNames = const [],
    final List<String> genreNames = const [],
    final List<String> tags = const [],
    this.description = '',
    this.coverImagePath,
    this.coverImageUrl,
    final List<Author> suggestedAuthors = const [],
    final List<Genre> suggestedGenres = const [],
    final Map<String, String>? fieldErrors,
    this.isISBN10Valid = false,
    this.isISBN13Valid = false,
    this.isDuplicate = false,
    this.createdBook,
    this.failure,
    this.isSuccess = false,
  }) : _authorNames = authorNames,
       _genreNames = genreNames,
       _tags = tags,
       _suggestedAuthors = suggestedAuthors,
       _suggestedGenres = suggestedGenres,
       _fieldErrors = fieldErrors;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isValidating;
  @override
  @JsonKey()
  final bool isUploadingImage;
  // Form data
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String subtitle;
  @override
  @JsonKey()
  final String isbn10;
  @override
  @JsonKey()
  final String isbn13;
  @override
  @JsonKey()
  final String publisher;
  @override
  final DateTime? publishedDate;
  @override
  @JsonKey()
  final String edition;
  @override
  @JsonKey()
  final String language;
  @override
  final int? pages;
  @override
  final BookFormat? format;
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
  @JsonKey()
  final String description;
  @override
  final String? coverImagePath;
  @override
  final String? coverImageUrl;
  // Available options
  final List<Author> _suggestedAuthors;
  // Available options
  @override
  @JsonKey()
  List<Author> get suggestedAuthors {
    if (_suggestedAuthors is EqualUnmodifiableListView)
      return _suggestedAuthors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedAuthors);
  }

  final List<Genre> _suggestedGenres;
  @override
  @JsonKey()
  List<Genre> get suggestedGenres {
    if (_suggestedGenres is EqualUnmodifiableListView) return _suggestedGenres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedGenres);
  }

  // Validation
  final Map<String, String>? _fieldErrors;
  // Validation
  @override
  Map<String, String>? get fieldErrors {
    final value = _fieldErrors;
    if (value == null) return null;
    if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final bool isISBN10Valid;
  @override
  @JsonKey()
  final bool isISBN13Valid;
  @override
  @JsonKey()
  final bool isDuplicate;
  // Success/Error states
  @override
  final Book? createdBook;
  @override
  final Failure? failure;
  @override
  @JsonKey()
  final bool isSuccess;

  @override
  String toString() {
    return 'CreateBookState(isLoading: $isLoading, isValidating: $isValidating, isUploadingImage: $isUploadingImage, title: $title, subtitle: $subtitle, isbn10: $isbn10, isbn13: $isbn13, publisher: $publisher, publishedDate: $publishedDate, edition: $edition, language: $language, pages: $pages, format: $format, authorNames: $authorNames, genreNames: $genreNames, tags: $tags, description: $description, coverImagePath: $coverImagePath, coverImageUrl: $coverImageUrl, suggestedAuthors: $suggestedAuthors, suggestedGenres: $suggestedGenres, fieldErrors: $fieldErrors, isISBN10Valid: $isISBN10Valid, isISBN13Valid: $isISBN13Valid, isDuplicate: $isDuplicate, createdBook: $createdBook, failure: $failure, isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBookStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isValidating, isValidating) ||
                other.isValidating == isValidating) &&
            (identical(other.isUploadingImage, isUploadingImage) ||
                other.isUploadingImage == isUploadingImage) &&
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
            const DeepCollectionEquality().equals(other.format, format) &&
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
                other.coverImagePath == coverImagePath) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            const DeepCollectionEquality().equals(
              other._suggestedAuthors,
              _suggestedAuthors,
            ) &&
            const DeepCollectionEquality().equals(
              other._suggestedGenres,
              _suggestedGenres,
            ) &&
            const DeepCollectionEquality().equals(
              other._fieldErrors,
              _fieldErrors,
            ) &&
            (identical(other.isISBN10Valid, isISBN10Valid) ||
                other.isISBN10Valid == isISBN10Valid) &&
            (identical(other.isISBN13Valid, isISBN13Valid) ||
                other.isISBN13Valid == isISBN13Valid) &&
            (identical(other.isDuplicate, isDuplicate) ||
                other.isDuplicate == isDuplicate) &&
            const DeepCollectionEquality().equals(
              other.createdBook,
              createdBook,
            ) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    isLoading,
    isValidating,
    isUploadingImage,
    title,
    subtitle,
    isbn10,
    isbn13,
    publisher,
    publishedDate,
    edition,
    language,
    pages,
    const DeepCollectionEquality().hash(format),
    const DeepCollectionEquality().hash(_authorNames),
    const DeepCollectionEquality().hash(_genreNames),
    const DeepCollectionEquality().hash(_tags),
    description,
    coverImagePath,
    coverImageUrl,
    const DeepCollectionEquality().hash(_suggestedAuthors),
    const DeepCollectionEquality().hash(_suggestedGenres),
    const DeepCollectionEquality().hash(_fieldErrors),
    isISBN10Valid,
    isISBN13Valid,
    isDuplicate,
    const DeepCollectionEquality().hash(createdBook),
    failure,
    isSuccess,
  ]);

  /// Create a copy of CreateBookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBookStateImplCopyWith<_$CreateBookStateImpl> get copyWith =>
      __$$CreateBookStateImplCopyWithImpl<_$CreateBookStateImpl>(
        this,
        _$identity,
      );
}

abstract class _CreateBookState implements CreateBookState {
  const factory _CreateBookState({
    final bool isLoading,
    final bool isValidating,
    final bool isUploadingImage,
    final String title,
    final String subtitle,
    final String isbn10,
    final String isbn13,
    final String publisher,
    final DateTime? publishedDate,
    final String edition,
    final String language,
    final int? pages,
    final BookFormat? format,
    final List<String> authorNames,
    final List<String> genreNames,
    final List<String> tags,
    final String description,
    final String? coverImagePath,
    final String? coverImageUrl,
    final List<Author> suggestedAuthors,
    final List<Genre> suggestedGenres,
    final Map<String, String>? fieldErrors,
    final bool isISBN10Valid,
    final bool isISBN13Valid,
    final bool isDuplicate,
    final Book? createdBook,
    final Failure? failure,
    final bool isSuccess,
  }) = _$CreateBookStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isValidating;
  @override
  bool get isUploadingImage; // Form data
  @override
  String get title;
  @override
  String get subtitle;
  @override
  String get isbn10;
  @override
  String get isbn13;
  @override
  String get publisher;
  @override
  DateTime? get publishedDate;
  @override
  String get edition;
  @override
  String get language;
  @override
  int? get pages;
  @override
  BookFormat? get format;
  @override
  List<String> get authorNames;
  @override
  List<String> get genreNames;
  @override
  List<String> get tags;
  @override
  String get description;
  @override
  String? get coverImagePath;
  @override
  String? get coverImageUrl; // Available options
  @override
  List<Author> get suggestedAuthors;
  @override
  List<Genre> get suggestedGenres; // Validation
  @override
  Map<String, String>? get fieldErrors;
  @override
  bool get isISBN10Valid;
  @override
  bool get isISBN13Valid;
  @override
  bool get isDuplicate; // Success/Error states
  @override
  Book? get createdBook;
  @override
  Failure? get failure;
  @override
  bool get isSuccess;

  /// Create a copy of CreateBookState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateBookStateImplCopyWith<_$CreateBookStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
