import 'package:dio/dio.dart';
import '../models/auth_request_model.dart';
import '../models/auth_response_model.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(LoginRequestModel request);
  Future<AuthResponseModel> register(RegisterRequestModel request);
  Future<void> logout();
  Future<RefreshTokenResponseModel> refreshToken(String refreshToken);
  Future<void> forgotPassword(ForgotPasswordRequestModel request);
  Future<void> resetPassword(ResetPasswordRequestModel request);
  Future<UserModel> getCurrentUser();
  Future<UserModel> updateProfile(UserModel user);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<AuthResponseModel> login(LoginRequestModel request) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        '/auth/login',
        data: request.toJson(),
      );
      return AuthResponseModel.fromJson(response.data!);
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<AuthResponseModel> register(RegisterRequestModel request) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        '/auth/register',
        data: request.toJson(),
      );
      return AuthResponseModel.fromJson(response.data!);
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await dio.post<void>('/auth/logout');
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<RefreshTokenResponseModel> refreshToken(String refreshToken) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
      );
      return RefreshTokenResponseModel.fromJson(response.data!);
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<void> forgotPassword(ForgotPasswordRequestModel request) async {
    try {
      await dio.post<void>('/auth/forgot-password', data: request.toJson());
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<void> resetPassword(ResetPasswordRequestModel request) async {
    try {
      await dio.post<void>('/auth/reset-password', data: request.toJson());
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      final response = await dio.get<Map<String, dynamic>>('/users/profile');
      return UserModel.fromJson(response.data!);
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<UserModel> updateProfile(UserModel user) async {
    try {
      final response = await dio.put<Map<String, dynamic>>(
        '/users/profile',
        data: user.toJson(),
      );
      return UserModel.fromJson(response.data!);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return Exception('Connection timeout');
        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode;
          final message = error.response?.data['message'] ?? 'Server error';
          return Exception('HTTP $statusCode: $message');
        case DioExceptionType.cancel:
          return Exception('Request was cancelled');
        case DioExceptionType.connectionError:
          return Exception('No internet connection');
        default:
          return Exception('Unexpected error occurred');
      }
    }
    return Exception('Unknown error occurred');
  }
}
