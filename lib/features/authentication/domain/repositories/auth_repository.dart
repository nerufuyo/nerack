import 'package:dartz/dartz.dart';
import '../entities/auth_request.dart';
import '../entities/auth_response.dart';
import '../entities/user_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> login(LoginRequest request);
  Future<Either<Failure, AuthResponse>> register(RegisterRequest request);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, RefreshTokenResponse>> refreshToken();
  Future<Either<Failure, void>> forgotPassword(ForgotPasswordRequest request);
  Future<Either<Failure, void>> resetPassword(ResetPasswordRequest request);
  Future<Either<Failure, UserEntity>> getCurrentUser();
  Future<Either<Failure, UserEntity>> updateProfile(UserEntity user);
  Future<bool> isLoggedIn();
  Future<String?> getStoredToken();
}
