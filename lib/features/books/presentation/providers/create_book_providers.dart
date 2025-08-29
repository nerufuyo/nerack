import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/book_repository.dart';
import '../../domain/usecases/book_usecases.dart';
import '../../data/repositories/book_repository_impl.dart';
import '../../data/datasources/book_remote_datasource.dart';
import '../../data/datasources/book_local_datasource.dart';
import 'create_book_state.dart';

// Data source providers
final bookRemoteDataSourceProvider = Provider<BookRemoteDataSource>((ref) {
  return BookRemoteDataSourceImpl();
});

final bookLocalDataSourceProvider = Provider<BookLocalDataSource>((ref) {
  return BookLocalDataSourceImpl();
});

// Repository provider
final bookRepositoryProvider = Provider<BookRepository>((ref) {
  return BookRepositoryImpl(
    remoteDataSource: ref.watch(bookRemoteDataSourceProvider),
    localDataSource: ref.watch(bookLocalDataSourceProvider),
  );
});

// Use case providers
final createBookUseCaseProvider = Provider<CreateBookUseCase>((ref) {
  return CreateBookUseCase(ref.watch(bookRepositoryProvider));
});

final uploadCoverImageUseCaseProvider = Provider<UploadCoverImageUseCase>((ref) {
  return UploadCoverImageUseCase(ref.watch(bookRepositoryProvider));
});

final searchAuthorsUseCaseProvider = Provider<SearchAuthorsUseCase>((ref) {
  return SearchAuthorsUseCase(ref.watch(bookRepositoryProvider));
});

final searchGenresUseCaseProvider = Provider<SearchGenresUseCase>((ref) {
  return SearchGenresUseCase(ref.watch(bookRepositoryProvider));
});

final validateISBNUseCaseProvider = Provider<ValidateISBNUseCase>((ref) {
  return ValidateISBNUseCase(ref.watch(bookRepositoryProvider));
});

// Main state provider
final createBookProvider = StateNotifierProvider<CreateBookNotifier, CreateBookState>((ref) {
  return CreateBookNotifier(
    createBookUseCase: ref.watch(createBookUseCaseProvider),
    uploadCoverImageUseCase: ref.watch(uploadCoverImageUseCaseProvider),
    searchAuthorsUseCase: ref.watch(searchAuthorsUseCaseProvider),
    searchGenresUseCase: ref.watch(searchGenresUseCaseProvider),
    validateISBNUseCase: ref.watch(validateISBNUseCaseProvider),
  );
});

// Individual state selectors for performance optimization
final createBookLoadingProvider = Provider<bool>((ref) {
  return ref.watch(createBookProvider.select((state) => state.isLoading));
});

final createBookTitleProvider = Provider<String>((ref) {
  return ref.watch(createBookProvider.select((state) => state.title));
});

final createBookAuthorsProvider = Provider<List<String>>((ref) {
  return ref.watch(createBookProvider.select((state) => state.authorNames));
});

final createBookGenresProvider = Provider<List<String>>((ref) {
  return ref.watch(createBookProvider.select((state) => state.genreNames));
});

final createBookFormValidProvider = Provider<bool>((ref) {
  return ref.watch(createBookProvider.select((state) => state.isFormValid));
});

final createBookErrorsProvider = Provider<Map<String, String>?>((ref) {
  return ref.watch(createBookProvider.select((state) => state.fieldErrors));
});
