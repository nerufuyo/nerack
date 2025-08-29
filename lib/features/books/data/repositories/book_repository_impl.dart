import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:nerack/core/error/failures.dart';
import 'package:nerack/features/books/domain/entities/book.dart' as domain;
import 'package:nerack/features/books/domain/repositories/book_repository.dart';
import 'package:nerack/features/books/data/datasources/book_remote_data_source.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource remoteDataSource;

  BookRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, domain.Book>> createBook(domain.CreateBookRequest request) async {
    try {
      // Convert domain request to data source request
      final dataSourceRequest = CreateBookRequest(
        title: request.title,
        subtitle: request.subtitle,
        description: request.description,
        isbn10: request.isbn10,
        isbn13: request.isbn13,
        publisher: request.publisher,
        publishedDate: request.publishedDate,
        pages: request.pages,
        language: request.language,
        format: request.format,
        edition: request.edition,
        coverImage: request.coverImagePath,
        tags: request.tags,
        genres: request.genreNames,
        authors: request.authorNames.map((name) => CreateAuthorRequest(
          name: name,
        )).toList(),
      );

      final bookModel = await remoteDataSource.createBook(dataSourceRequest);
      
      // Convert BookModel to Book entity
      final book = domain.Book(
        id: bookModel.id,
        title: bookModel.title,
        subtitle: bookModel.subtitle,
        description: bookModel.description,
        isbn10: bookModel.isbn10,
        isbn13: bookModel.isbn13,
        publisher: bookModel.publisher,
        publishedDate: bookModel.publishedDate,
        pages: bookModel.pages,
        language: bookModel.language,
        format: bookModel.format,
        edition: bookModel.edition,
        createdAt: bookModel.createdAt,
        updatedAt: bookModel.updatedAt,
        authors: bookModel.authors.map((bookAuthor) => domain.Author(
          id: bookAuthor.author.id,
          name: bookAuthor.author.name,
          createdAt: bookAuthor.author.createdAt,
          updatedAt: bookAuthor.author.updatedAt,
        )).toList(),
      );

      return Right(book);
    } on ValidationException catch (e) {
      return Left(ValidationFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<domain.Author>>> searchAuthors(String query, {int limit = 10}) async {
    try {
      if (query.trim().isEmpty) {
        return const Right([]);
      }

      final authorModels = await remoteDataSource.searchAuthors(query);
      final authors = authorModels.map((model) => domain.Author(
        id: model.id,
        name: model.name,
        createdAt: model.createdAt,
        updatedAt: model.updatedAt,
      )).toList();
      
      return Right(authors);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<domain.Genre>>> searchGenres(String query, {int limit = 10}) async {
    try {
      if (query.trim().isEmpty) {
        return const Right([]);
      }

      final genreModels = await remoteDataSource.searchGenres(query);
      final genres = genreModels.map((model) => domain.Genre(
        id: model.id,
        name: model.name,
        category: model.category,
        description: model.description,
        bookCount: model.bookCount,
        createdAt: model.createdAt,
        updatedAt: model.updatedAt,
      )).toList();
      
      return Right(genres);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadCoverImage(String filePath) async {
    try {
      final file = File(filePath);
      
      if (!await file.exists()) {
        return const Left(ValidationFailure(message: 'Image file does not exist'));
      }

      final imageUrl = await remoteDataSource.uploadCoverImage(file);
      return Right(imageUrl);
    } on ValidationException catch (e) {
      return Left(ValidationFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<domain.Genre>>> getGenres({
    int page = 1,
    int limit = 50,
    String? search,
    String? category,
  }) async {
    try {
      final genreModels = await remoteDataSource.getPopularGenres();
      final genres = genreModels.map((model) => domain.Genre(
        id: model.id,
        name: model.name,
        category: model.category,
        description: model.description,
        bookCount: model.bookCount,
        createdAt: model.createdAt,
        updatedAt: model.updatedAt,
      )).toList();
      
      return Right(genres);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> validateISBN(String isbn) async {
    try {
      if (isbn.trim().isEmpty) {
        return const Right(false);
      }

      final isValid = await remoteDataSource.validateISBN(isbn);
      return Right(isValid);
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> checkDuplicate({
    String? isbn10,
    String? isbn13,
    String? title,
  }) async {
    try {
      if (title?.trim().isEmpty != false && isbn10?.trim().isEmpty != false && isbn13?.trim().isEmpty != false) {
        return const Right(false);
      }

      final isDuplicate = await remoteDataSource.checkDuplicateBook(title ?? '', isbn10 ?? isbn13);
      return Right(isDuplicate);
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  // Placeholder implementations for missing required methods
  @override
  Future<Either<Failure, List<domain.Book>>> getBooks({
    int page = 1,
    int limit = 20,
    String? search,
    List<String>? genres,
    String? author,
    String? status,
  }) async {
    return const Left(UnexpectedFailure(message: 'Not implemented yet'));
  }

  @override
  Future<Either<Failure, domain.Book>> getBookById(String id) async {
    return const Left(UnexpectedFailure(message: 'Not implemented yet'));
  }

  @override
  Future<Either<Failure, List<domain.Book>>> searchBooks(String query, {int limit = 10}) async {
    return const Left(UnexpectedFailure(message: 'Not implemented yet'));
  }

  @override
  Future<Either<Failure, domain.Book>> updateBook(String id, Map<String, dynamic> updates) async {
    return const Left(UnexpectedFailure(message: 'Not implemented yet'));
  }

  @override
  Future<Either<Failure, void>> deleteBook(String id) async {
    return const Left(UnexpectedFailure(message: 'Not implemented yet'));
  }

  @override
  Future<Either<Failure, domain.Author>> createAuthor(String name) async {
    return const Left(UnexpectedFailure(message: 'Not implemented yet'));
  }

  @override
  Future<Either<Failure, domain.Genre>> createGenre(String name, {String? category}) async {
    return const Left(UnexpectedFailure(message: 'Not implemented yet'));
  }
}
