import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../domain/entities/book.dart';
import '../../domain/entities/author.dart';
import '../../domain/entities/genre.dart';
import '../models/book_model.dart';
import '../models/author_model.dart';
import '../models/genre_model.dart';

/// Remote data source for book-related API operations
/// 
/// Handles all HTTP requests to the backend API for book management,
/// including creation, searching, and metadata operations.
abstract class BookRemoteDataSource {
  /// Create a new book with the provided data
  Future<BookModel> createBook(CreateBookRequest request);
  
  /// Search for authors by name
  Future<List<AuthorModel>> searchAuthors(String query);
  
  /// Search for genres by name  
  Future<List<GenreModel>> searchGenres(String query);
  
  /// Upload book cover image
  Future<String> uploadCoverImage(File imageFile);
  
  /// Get popular genres
  Future<List<GenreModel>> getPopularGenres();
  
  /// Validate ISBN
  Future<bool> validateISBN(String isbn);
  
  /// Check for duplicate books
  Future<bool> checkDuplicateBook(String title, String? isbn);
}

/// Implementation of BookRemoteDataSource using HTTP client
class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  final http.Client client;
  final String baseUrl;
  final String? authToken;
  
  BookRemoteDataSourceImpl({
    required this.client,
    required this.baseUrl,
    this.authToken,
  });
  
  /// Common headers for API requests
  Map<String, String> get _headers {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    
    if (authToken != null) {
      headers['Authorization'] = 'Bearer $authToken';
    }
    
    return headers;
  }
  
  /// Common headers for multipart requests
  Map<String, String> get _multipartHeaders {
    final headers = <String, String>{};
    
    if (authToken != null) {
      headers['Authorization'] = 'Bearer $authToken';
    }
    
    return headers;
  }

  @override
  Future<BookModel> createBook(CreateBookRequest request) async {
    final response = await client.post(
      Uri.parse('$baseUrl/books'),
      headers: _headers,
      body: json.encode(request.toJson()),
    );
    
    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      return BookModel.fromJson(data);
    } else if (response.statusCode == 409) {
      throw DuplicateBookException('Book with this title or ISBN already exists');
    } else if (response.statusCode == 400) {
      final error = json.decode(response.body);
      throw ValidationException(error['message'] ?? 'Invalid book data');
    } else {
      throw ServerException('Failed to create book: ${response.statusCode}');
    }
  }
  
  @override
  Future<List<AuthorModel>> searchAuthors(String query) async {
    final response = await client.get(
      Uri.parse('$baseUrl/authors/search?q=${Uri.encodeComponent(query)}&limit=10'),
      headers: _headers,
    );
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((item) => AuthorModel.fromJson(item)).toList();
    } else {
      throw ServerException('Failed to search authors: ${response.statusCode}');
    }
  }
  
  @override
  Future<List<GenreModel>> searchGenres(String query) async {
    final response = await client.get(
      Uri.parse('$baseUrl/genres/search?q=${Uri.encodeComponent(query)}&limit=10'),
      headers: _headers,
    );
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((item) => GenreModel.fromJson(item)).toList();
    } else {
      throw ServerException('Failed to search genres: ${response.statusCode}');
    }
  }
  
  @override
  Future<String> uploadCoverImage(File imageFile) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/books/upload-cover'),
    );
    
    request.headers.addAll(_multipartHeaders);
    request.files.add(await http.MultipartFile.fromPath(
      'image',
      imageFile.path,
    ));
    
    final streamedResponse = await client.send(request);
    final response = await http.Response.fromStream(streamedResponse);
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['imageUrl'] as String;
    } else if (response.statusCode == 413) {
      throw ValidationException('Image file is too large. Please choose a smaller image.');
    } else if (response.statusCode == 415) {
      throw ValidationException('Invalid image format. Please use JPEG, PNG, or WebP.');
    } else {
      throw ServerException('Failed to upload image: ${response.statusCode}');
    }
  }
  
  @override
  Future<List<GenreModel>> getPopularGenres() async {
    final response = await client.get(
      Uri.parse('$baseUrl/genres/popular?limit=20'),
      headers: _headers,
    );
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((item) => GenreModel.fromJson(item)).toList();
    } else {
      throw ServerException('Failed to get popular genres: ${response.statusCode}');
    }
  }
  
  @override
  Future<bool> validateISBN(String isbn) async {
    final response = await client.post(
      Uri.parse('$baseUrl/books/validate-isbn'),
      headers: _headers,
      body: json.encode({'isbn': isbn}),
    );
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['isValid'] as bool;
    } else {
      return false; // Consider invalid if API fails
    }
  }
  
  @override
  Future<bool> checkDuplicateBook(String title, String? isbn) async {
    final queryParams = <String, String>{
      'title': title,
    };
    
    if (isbn != null && isbn.isNotEmpty) {
      queryParams['isbn'] = isbn;
    }
    
    final uri = Uri.parse('$baseUrl/books/check-duplicate').replace(
      queryParameters: queryParams,
    );
    
    final response = await client.get(uri, headers: _headers);
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['isDuplicate'] as bool;
    } else {
      return false; // Consider not duplicate if API fails
    }
  }
}

/// Request model for creating a book
class CreateBookRequest {
  final String title;
  final String? subtitle;
  final String? isbn;
  final String? isbn10;
  final String? isbn13;
  final String? publisher;
  final DateTime? publishedDate;
  final String? edition;
  final String? language;
  final int? pages;
  final String? format;
  final List<String>? genres;
  final List<String>? tags;
  final String? description;
  final String? coverImage;
  final String? thumbnailUrl;
  final List<CreateAuthorRequest>? authors;
  final String? initialStatus;
  final int? priority;
  
  CreateBookRequest({
    required this.title,
    this.subtitle,
    this.isbn,
    this.isbn10,
    this.isbn13,
    this.publisher,
    this.publishedDate,
    this.edition,
    this.language,
    this.pages,
    this.format,
    this.genres,
    this.tags,
    this.description,
    this.coverImage,
    this.thumbnailUrl,
    this.authors,
    this.initialStatus,
    this.priority,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      if (isbn != null) 'isbn': isbn,
      if (isbn10 != null) 'isbn10': isbn10,
      if (isbn13 != null) 'isbn13': isbn13,
      if (publisher != null) 'publisher': publisher,
      if (publishedDate != null) 'publishedDate': publishedDate!.toIso8601String(),
      if (edition != null) 'edition': edition,
      if (language != null) 'language': language,
      if (pages != null) 'pages': pages,
      if (format != null) 'format': format,
      if (genres != null) 'genres': genres,
      if (tags != null) 'tags': tags,
      if (description != null) 'description': description,
      if (coverImage != null) 'coverImage': coverImage,
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
      if (authors != null) 'authors': authors!.map((a) => a.toJson()).toList(),
      if (initialStatus != null) 'initialStatus': initialStatus,
      if (priority != null) 'priority': priority,
    };
  }
}

/// Request model for creating an author
class CreateAuthorRequest {
  final String name;
  final String? bio;
  final DateTime? birthDate;
  final DateTime? deathDate;
  final String? nationality;
  final String? image;
  final String? role;
  
  CreateAuthorRequest({
    required this.name,
    this.bio,
    this.birthDate,
    this.deathDate,
    this.nationality,
    this.image,
    this.role = 'author',
  });
  
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      if (bio != null) 'bio': bio,
      if (birthDate != null) 'birthDate': birthDate!.toIso8601String(),
      if (deathDate != null) 'deathDate': deathDate!.toIso8601String(),
      if (nationality != null) 'nationality': nationality,
      if (image != null) 'image': image,
      if (role != null) 'role': role,
    };
  }
}

/// Custom exceptions for API operations
class ServerException implements Exception {
  final String message;
  ServerException(this.message);
  
  @override
  String toString() => 'ServerException: $message';
}

class ValidationException implements Exception {
  final String message;
  ValidationException(this.message);
  
  @override
  String toString() => 'ValidationException: $message';
}

class DuplicateBookException implements Exception {
  final String message;
  DuplicateBookException(this.message);
  
  @override
  String toString() => 'DuplicateBookException: $message';
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
  
  @override
  String toString() => 'NetworkException: $message';
}
