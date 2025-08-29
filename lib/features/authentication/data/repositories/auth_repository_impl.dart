import 'package:dartz/dartz.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../domain/entities/auth_request.dart';
import '../../domain/entities/auth_response.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/auth_request_model.dart';
import '../models/user_model.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/exceptions.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final Connectivity connectivity;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectivity,
  });

  @override
  Future<Either<Failure, AuthResponse>> login(LoginRequest request) async {
    if (!await _hasInternetConnection()) {
      return const Left(NetworkFailure());
    }

    try {
      final requestModel = LoginRequestModel.fromEntity(request);
      final response = await remoteDataSource.login(requestModel);

      // Store tokens locally
      await localDataSource.storeTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );

      // Store remember me preference
      await localDataSource.storeRememberMe(request.rememberMe);

      return Right(response.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> register(
    RegisterRequest request,
  ) async {
    if (!await _hasInternetConnection()) {
      return const Left(NetworkFailure());
    }

    try {
      final requestModel = RegisterRequestModel.fromEntity(request);
      final response = await remoteDataSource.register(requestModel);

      // Store tokens locally
      await localDataSource.storeTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );

      return Right(response.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      // Try to logout from server (don't fail if offline)
      if (await _hasInternetConnection()) {
        await remoteDataSource.logout();
      }

      // Always clear local tokens
      await localDataSource.clearTokens();

      return const Right(null);
    } catch (e) {
      // Even if server logout fails, clear local tokens
      await localDataSource.clearTokens();
      return const Right(null);
    }
  }

  @override
  Future<Either<Failure, RefreshTokenResponse>> refreshToken() async {
    if (!await _hasInternetConnection()) {
      return const Left(NetworkFailure());
    }

    try {
      final refreshToken = await localDataSource.getRefreshToken();
      if (refreshToken == null) {
        return const Left(
          AuthenticationFailure(message: 'No refresh token available'),
        );
      }

      final response = await remoteDataSource.refreshToken(refreshToken);

      // Update stored access token
      await localDataSource.storeTokens(
        accessToken: response.accessToken,
        refreshToken: refreshToken, // Keep the same refresh token
      );

      return Right(response.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword(
    ForgotPasswordRequest request,
  ) async {
    if (!await _hasInternetConnection()) {
      return const Left(NetworkFailure());
    }

    try {
      final requestModel = ForgotPasswordRequestModel.fromEntity(request);
      await remoteDataSource.forgotPassword(requestModel);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(
    ResetPasswordRequest request,
  ) async {
    if (!await _hasInternetConnection()) {
      return const Left(NetworkFailure());
    }

    try {
      final requestModel = ResetPasswordRequestModel.fromEntity(request);
      await remoteDataSource.resetPassword(requestModel);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    if (!await _hasInternetConnection()) {
      return const Left(NetworkFailure());
    }

    try {
      final userModel = await remoteDataSource.getCurrentUser();
      return Right(userModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateProfile(UserEntity user) async {
    if (!await _hasInternetConnection()) {
      return const Left(NetworkFailure());
    }

    try {
      final userModel = UserModel.fromEntity(user);
      final updatedUserModel = await remoteDataSource.updateProfile(userModel);
      return Right(updatedUserModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final accessToken = await localDataSource.getAccessToken();
    final refreshToken = await localDataSource.getRefreshToken();
    return accessToken != null && refreshToken != null;
  }

  @override
  Future<String?> getStoredToken() async {
    return await localDataSource.getAccessToken();
  }

  Future<bool> _hasInternetConnection() async {
    final connectivityResult = await connectivity.checkConnectivity();
    return !connectivityResult.contains(ConnectivityResult.none);
  }
}
