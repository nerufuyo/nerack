import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/book.dart';
import '../../../domain/usecases/book_usecases.dart';
import '../../../../core/error/failures.dart';

part 'create_book_state.freezed.dart';

@freezed
class CreateBookState with _$CreateBookState {
  const factory CreateBookState({
    @Default(false) bool isLoading,
    @Default(false) bool isValidating,
    @Default(false) bool isUploadingImage,
    
    // Form data
    @Default('') String title,
    @Default('') String subtitle,
    @Default('') String isbn10,
    @Default('') String isbn13,
    @Default('') String publisher,
    DateTime? publishedDate,
    @Default('') String edition,
    @Default('en') String language,
    int? pages,
    BookFormat? format,
    @Default([]) List<String> authorNames,
    @Default([]) List<String> genreNames,
    @Default([]) List<String> tags,
    @Default('') String description,
    String? coverImagePath,
    String? coverImageUrl,
    
    // Available options
    @Default([]) List<Author> suggestedAuthors,
    @Default([]) List<Genre> suggestedGenres,
    
    // Validation
    Map<String, String>? fieldErrors,
    @Default(false) bool isISBN10Valid,
    @Default(false) bool isISBN13Valid,
    @Default(false) bool isDuplicate,
    
    // Success/Error states
    Book? createdBook,
    Failure? failure,
    @Default(false) bool isSuccess,
  }) = _CreateBookState;
}

class CreateBookNotifier extends StateNotifier<CreateBookState> {
  final CreateBookUseCase _createBookUseCase;
  final UploadCoverImageUseCase _uploadCoverImageUseCase;
  final SearchAuthorsUseCase _searchAuthorsUseCase;
  final SearchGenresUseCase _searchGenresUseCase;
  final ValidateISBNUseCase _validateISBNUseCase;

  CreateBookNotifier({
    required CreateBookUseCase createBookUseCase,
    required UploadCoverImageUseCase uploadCoverImageUseCase,
    required SearchAuthorsUseCase searchAuthorsUseCase,
    required SearchGenresUseCase searchGenresUseCase,
    required ValidateISBNUseCase validateISBNUseCase,
  })  : _createBookUseCase = createBookUseCase,
        _uploadCoverImageUseCase = uploadCoverImageUseCase,
        _searchAuthorsUseCase = searchAuthorsUseCase,
        _searchGenresUseCase = searchGenresUseCase,
        _validateISBNUseCase = validateISBNUseCase,
        super(const CreateBookState());

  // Form field updates
  void updateTitle(String title) {
    state = state.copyWith(title: title);
    _clearFieldError('title');
  }

  void updateSubtitle(String subtitle) {
    state = state.copyWith(subtitle: subtitle);
  }

  void updateISBN10(String isbn10) {
    state = state.copyWith(
      isbn10: isbn10,
      isISBN10Valid: false,
      isDuplicate: false,
    );
    _clearFieldError('isbn10');
    if (isbn10.isNotEmpty) {
      _validateISBN10(isbn10);
    }
  }

  void updateISBN13(String isbn13) {
    state = state.copyWith(
      isbn13: isbn13,
      isISBN13Valid: false,
      isDuplicate: false,
    );
    _clearFieldError('isbn13');
    if (isbn13.isNotEmpty) {
      _validateISBN13(isbn13);
    }
  }

  void updatePublisher(String publisher) {
    state = state.copyWith(publisher: publisher);
  }

  void updatePublishedDate(DateTime? date) {
    state = state.copyWith(publishedDate: date);
  }

  void updateEdition(String edition) {
    state = state.copyWith(edition: edition);
  }

  void updateLanguage(String language) {
    state = state.copyWith(language: language);
    _clearFieldError('language');
  }

  void updatePages(int? pages) {
    state = state.copyWith(pages: pages);
    _clearFieldError('pages');
  }

  void updateFormat(BookFormat? format) {
    state = state.copyWith(format: format);
  }

  void updateDescription(String description) {
    state = state.copyWith(description: description);
  }

  // Author management
  void addAuthor(String authorName) {
    if (authorName.trim().isNotEmpty && !state.authorNames.contains(authorName.trim())) {
      final updatedAuthors = [...state.authorNames, authorName.trim()];
      state = state.copyWith(authorNames: updatedAuthors);
      _clearFieldError('authors');
    }
  }

  void removeAuthor(String authorName) {
    final updatedAuthors = state.authorNames.where((name) => name != authorName).toList();
    state = state.copyWith(authorNames: updatedAuthors);
  }

  void searchAuthors(String query) async {
    if (query.length < 2) {
      state = state.copyWith(suggestedAuthors: []);
      return;
    }

    final result = await _searchAuthorsUseCase(query: query, limit: 10);
    result.fold(
      (failure) => {
        // Handle error silently for suggestions
      },
      (authors) => state = state.copyWith(suggestedAuthors: authors),
    );
  }

  // Genre management
  void addGenre(String genreName) {
    if (genreName.trim().isNotEmpty && !state.genreNames.contains(genreName.trim())) {
      final updatedGenres = [...state.genreNames, genreName.trim()];
      state = state.copyWith(genreNames: updatedGenres);
    }
  }

  void removeGenre(String genreName) {
    final updatedGenres = state.genreNames.where((name) => name != genreName).toList();
    state = state.copyWith(genreNames: updatedGenres);
  }

  void searchGenres(String query) async {
    if (query.length < 2) {
      state = state.copyWith(suggestedGenres: []);
      return;
    }

    final result = await _searchGenresUseCase(query: query, limit: 10);
    result.fold(
      (failure) => {
        // Handle error silently for suggestions
      },
      (genres) => state = state.copyWith(suggestedGenres: genres),
    );
  }

  // Tag management
  void addTag(String tag) {
    if (tag.trim().isNotEmpty && !state.tags.contains(tag.trim())) {
      final updatedTags = [...state.tags, tag.trim()];
      state = state.copyWith(tags: updatedTags);
    }
  }

  void removeTag(String tag) {
    final updatedTags = state.tags.where((t) => t != tag).toList();
    state = state.copyWith(tags: updatedTags);
  }

  // Cover image management
  void updateCoverImagePath(String? imagePath) {
    state = state.copyWith(
      coverImagePath: imagePath,
      coverImageUrl: null, // Clear URL when local path is set
    );
  }

  Future<void> uploadCoverImage(String imagePath) async {
    state = state.copyWith(isUploadingImage: true);

    final result = await _uploadCoverImageUseCase(imagePath);
    
    result.fold(
      (failure) => state = state.copyWith(
        isUploadingImage: false,
        failure: failure,
      ),
      (imageUrl) => state = state.copyWith(
        isUploadingImage: false,
        coverImageUrl: imageUrl,
        failure: null,
      ),
    );
  }

  // Validation
  Future<void> _validateISBN10(String isbn) async {
    state = state.copyWith(isValidating: true);

    final result = await _validateISBNUseCase(isbn);
    
    result.fold(
      (failure) => state = state.copyWith(
        isValidating: false,
        isISBN10Valid: false,
      ),
      (isValid) => state = state.copyWith(
        isValidating: false,
        isISBN10Valid: isValid,
      ),
    );
  }

  Future<void> _validateISBN13(String isbn) async {
    state = state.copyWith(isValidating: true);

    final result = await _validateISBNUseCase(isbn);
    
    result.fold(
      (failure) => state = state.copyWith(
        isValidating: false,
        isISBN13Valid: false,
      ),
      (isValid) => state = state.copyWith(
        isValidating: false,
        isISBN13Valid: isValid,
      ),
    );
  }

  // Form submission
  Future<void> createBook() async {
    state = state.copyWith(
      isLoading: true,
      failure: null,
      fieldErrors: null,
      isSuccess: false,
    );

    final request = CreateBookRequest(
      title: state.title,
      subtitle: state.subtitle.isEmpty ? null : state.subtitle,
      isbn10: state.isbn10.isEmpty ? null : state.isbn10,
      isbn13: state.isbn13.isEmpty ? null : state.isbn13,
      publisher: state.publisher.isEmpty ? null : state.publisher,
      publishedDate: state.publishedDate,
      edition: state.edition.isEmpty ? null : state.edition,
      language: state.language,
      pages: state.pages,
      format: state.format?.displayName,
      authorNames: state.authorNames,
      genreNames: state.genreNames,
      tags: state.tags,
      description: state.description.isEmpty ? null : state.description,
      coverImagePath: state.coverImagePath,
    );

    final result = await _createBookUseCase(request);

    result.fold(
      (failure) {
        Map<String, String>? fieldErrors;
        if (failure is ValidationFailure) {
          fieldErrors = failure.fieldErrors;
        }
        
        state = state.copyWith(
          isLoading: false,
          failure: failure,
          fieldErrors: fieldErrors,
          isSuccess: false,
        );
      },
      (book) => state = state.copyWith(
        isLoading: false,
        createdBook: book,
        failure: null,
        fieldErrors: null,
        isSuccess: true,
      ),
    );
  }

  // Utility methods
  void _clearFieldError(String field) {
    if (state.fieldErrors?.containsKey(field) == true) {
      final updatedErrors = Map<String, String>.from(state.fieldErrors!);
      updatedErrors.remove(field);
      state = state.copyWith(
        fieldErrors: updatedErrors.isEmpty ? null : updatedErrors,
      );
    }
  }

  void clearErrors() {
    state = state.copyWith(
      failure: null,
      fieldErrors: null,
    );
  }

  void resetForm() {
    state = const CreateBookState();
  }

  // Validation helpers
  bool get isFormValid {
    return state.title.trim().isNotEmpty &&
           state.authorNames.isNotEmpty &&
           (state.fieldErrors?.isEmpty ?? true);
  }

  bool get hasRequiredFields {
    return state.title.trim().isNotEmpty && state.authorNames.isNotEmpty;
  }
}
