import 'package:dartz/dartz.dart';
import '../entities/book.dart';
import '../repositories/book_repository.dart';
import '../../../../core/error/failures.dart';

class CreateBookUseCase {
  final BookRepository repository;

  CreateBookUseCase(this.repository);

  Future<Either<Failure, Book>> call(CreateBookRequest request) async {
    // Validate the request
    final validationResult = _validateCreateBookRequest(request);
    if (validationResult != null) {
      return Left(validationResult);
    }

    // Check for duplicates if ISBN is provided
    if (request.isbn10 != null || request.isbn13 != null || request.title.isNotEmpty) {
      final duplicateCheck = await repository.checkDuplicate(
        isbn10: request.isbn10,
        isbn13: request.isbn13,
        title: request.title,
      );

      return duplicateCheck.fold(
        (failure) => Left(failure),
        (isDuplicate) {
          if (isDuplicate) {
            return const Left(DuplicateBookFailure(
              message: 'A book with this ISBN or title already exists',
            ));
          }
          return repository.createBook(request);
        },
      );
    }

    return repository.createBook(request);
  }

  ValidationFailure? _validateCreateBookRequest(CreateBookRequest request) {
    final errors = <String, String>{};

    // Title validation
    if (request.title.trim().isEmpty) {
      errors['title'] = 'Title is required';
    } else if (request.title.trim().length < 2) {
      errors['title'] = 'Title must be at least 2 characters long';
    } else if (request.title.trim().length > 255) {
      errors['title'] = 'Title cannot exceed 255 characters';
    }

    // ISBN validation
    if (request.isbn10 != null && request.isbn10!.isNotEmpty) {
      if (!_isValidISBN10(request.isbn10!)) {
        errors['isbn10'] = 'Invalid ISBN-10 format';
      }
    }

    if (request.isbn13 != null && request.isbn13!.isNotEmpty) {
      if (!_isValidISBN13(request.isbn13!)) {
        errors['isbn13'] = 'Invalid ISBN-13 format';
      }
    }

    // Pages validation
    if (request.pages != null && request.pages! <= 0) {
      errors['pages'] = 'Page count must be positive';
    }

    // Authors validation
    if (request.authorNames.isEmpty) {
      errors['authors'] = 'At least one author is required';
    } else {
      for (int i = 0; i < request.authorNames.length; i++) {
        if (request.authorNames[i].trim().isEmpty) {
          errors['authors'] = 'Author names cannot be empty';
          break;
        }
      }
    }

    // Language validation
    if (request.language.length != 2) {
      errors['language'] = 'Language must be a 2-character code (e.g., "en")';
    }

    if (errors.isNotEmpty) {
      return ValidationFailure(
        message: 'Please fix the following errors',
        fieldErrors: errors,
      );
    }

    return null;
  }

  bool _isValidISBN10(String isbn) {
    // Remove hyphens and spaces
    final cleanIsbn = isbn.replaceAll(RegExp(r'[-\s]'), '');
    
    if (cleanIsbn.length != 10) return false;
    
    // Check format (9 digits + check digit which can be X)
    if (!RegExp(r'^\d{9}[\dX]$').hasMatch(cleanIsbn)) return false;
    
    // Calculate checksum
    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += int.parse(cleanIsbn[i]) * (10 - i);
    }
    
    final checkDigit = cleanIsbn[9];
    final remainder = sum % 11;
    final expectedCheck = remainder == 0 ? '0' : 
                         remainder == 1 ? 'X' : 
                         (11 - remainder).toString();
    
    return checkDigit == expectedCheck;
  }

  bool _isValidISBN13(String isbn) {
    // Remove hyphens and spaces
    final cleanIsbn = isbn.replaceAll(RegExp(r'[-\s]'), '');
    
    if (cleanIsbn.length != 13) return false;
    
    // Check format (13 digits)
    if (!RegExp(r'^\d{13}$').hasMatch(cleanIsbn)) return false;
    
    // Calculate checksum
    int sum = 0;
    for (int i = 0; i < 12; i++) {
      final digit = int.parse(cleanIsbn[i]);
      sum += digit * (i % 2 == 0 ? 1 : 3);
    }
    
    final checkDigit = int.parse(cleanIsbn[12]);
    final expectedCheck = (10 - (sum % 10)) % 10;
    
    return checkDigit == expectedCheck;
  }
}

class UploadCoverImageUseCase {
  final BookRepository repository;

  UploadCoverImageUseCase(this.repository);

  Future<Either<Failure, String>> call(String filePath) async {
    if (filePath.isEmpty) {
      return const Left(ValidationFailure(
        message: 'File path cannot be empty',
      ));
    }

    return repository.uploadCoverImage(filePath);
  }
}

class SearchBooksUseCase {
  final BookRepository repository;

  SearchBooksUseCase(this.repository);

  Future<Either<Failure, List<Book>>> call({
    required String query,
    int limit = 10,
  }) async {
    if (query.trim().isEmpty) {
      return const Left(ValidationFailure(
        message: 'Search query cannot be empty',
      ));
    }

    if (query.trim().length < 2) {
      return const Left(ValidationFailure(
        message: 'Search query must be at least 2 characters long',
      ));
    }

    return repository.searchBooks(query.trim(), limit: limit);
  }
}

class GetBooksUseCase {
  final BookRepository repository;

  GetBooksUseCase(this.repository);

  Future<Either<Failure, List<Book>>> call({
    int page = 1,
    int limit = 20,
    String? search,
    List<String>? genres,
    String? author,
    String? status,
  }) async {
    if (page < 1) {
      return const Left(ValidationFailure(
        message: 'Page number must be positive',
      ));
    }

    if (limit < 1 || limit > 100) {
      return const Left(ValidationFailure(
        message: 'Limit must be between 1 and 100',
      ));
    }

    return repository.getBooks(
      page: page,
      limit: limit,
      search: search?.trim(),
      genres: genres,
      author: author?.trim(),
      status: status,
    );
  }
}

class GetBookByIdUseCase {
  final BookRepository repository;

  GetBookByIdUseCase(this.repository);

  Future<Either<Failure, Book>> call(String id) async {
    if (id.trim().isEmpty) {
      return const Left(ValidationFailure(
        message: 'Book ID cannot be empty',
      ));
    }

    return repository.getBookById(id.trim());
  }
}

class SearchAuthorsUseCase {
  final BookRepository repository;

  SearchAuthorsUseCase(this.repository);

  Future<Either<Failure, List<Author>>> call({
    required String query,
    int limit = 10,
  }) async {
    if (query.trim().isEmpty) {
      return const Left(ValidationFailure(
        message: 'Search query cannot be empty',
      ));
    }

    if (query.trim().length < 2) {
      return const Left(ValidationFailure(
        message: 'Search query must be at least 2 characters long',
      ));
    }

    return repository.searchAuthors(query.trim(), limit: limit);
  }
}

class SearchGenresUseCase {
  final BookRepository repository;

  SearchGenresUseCase(this.repository);

  Future<Either<Failure, List<Genre>>> call({
    required String query,
    int limit = 10,
  }) async {
    if (query.trim().isEmpty) {
      return const Left(ValidationFailure(
        message: 'Search query cannot be empty',
      ));
    }

    return repository.searchGenres(query.trim(), limit: limit);
  }
}

class ValidateISBNUseCase {
  final BookRepository repository;

  ValidateISBNUseCase(this.repository);

  Future<Either<Failure, bool>> call(String isbn) async {
    if (isbn.trim().isEmpty) {
      return const Left(ValidationFailure(
        message: 'ISBN cannot be empty',
      ));
    }

    return repository.validateISBN(isbn.trim());
  }
}
