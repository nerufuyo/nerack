import 'package:dartz/dartz.dart';
import '../entities/book.dart';
import '../../../../core/error/failures.dart';

abstract class BookRepository {
  // Create operations
  Future<Either<Failure, Book>> createBook(CreateBookRequest request);
  Future<Either<Failure, String>> uploadCoverImage(String filePath);
  
  // Read operations
  Future<Either<Failure, List<Book>>> getBooks({
    int page = 1,
    int limit = 20,
    String? search,
    List<String>? genres,
    String? author,
    String? status,
  });
  
  Future<Either<Failure, Book>> getBookById(String id);
  Future<Either<Failure, List<Book>>> searchBooks(String query, {int limit = 10});
  
  // Update operations
  Future<Either<Failure, Book>> updateBook(String id, Map<String, dynamic> updates);
  
  // Delete operations
  Future<Either<Failure, void>> deleteBook(String id);
  
  // Author operations
  Future<Either<Failure, List<Author>>> searchAuthors(String query, {int limit = 10});
  Future<Either<Failure, Author>> createAuthor(String name);
  
  // Genre operations
  Future<Either<Failure, List<Genre>>> getGenres({
    int page = 1,
    int limit = 50,
    String? search,
    String? category,
  });
  Future<Either<Failure, List<Genre>>> searchGenres(String query, {int limit = 10});
  Future<Either<Failure, Genre>> createGenre(String name, {String? category});
  
  // ISBN validation
  Future<Either<Failure, bool>> validateISBN(String isbn);
  Future<Either<Failure, bool>> checkDuplicate({String? isbn10, String? isbn13, String? title});
}

abstract class BookLocalRepository {
  // Cache operations
  Future<Either<Failure, void>> cacheBooksData(List<Book> books);
  Future<Either<Failure, List<Book>>> getCachedBooks();
  Future<Either<Failure, void>> cacheBook(Book book);
  Future<Either<Failure, Book?>> getCachedBook(String id);
  
  // Offline operations
  Future<Either<Failure, void>> saveDraft(CreateBookRequest draft);
  Future<Either<Failure, List<CreateBookRequest>>> getDrafts();
  Future<Either<Failure, void>> deleteDraft(int draftId);
  
  // User preferences
  Future<Either<Failure, Map<String, dynamic>>> getUserPreferences();
  Future<Either<Failure, void>> saveUserPreferences(Map<String, dynamic> preferences);
}
