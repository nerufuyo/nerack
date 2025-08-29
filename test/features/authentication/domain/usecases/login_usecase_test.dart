import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';
import 'package:nerack/features/authentication/domain/entities/auth_request.dart';
import 'package:nerack/features/authentication/domain/entities/auth_response.dart';
import 'package:nerack/features/authentication/domain/repositories/auth_repository.dart';
import 'package:nerack/features/authentication/domain/usecases/auth_usecases.dart';
import 'package:nerack/core/errors/failures.dart';

// Generate mocks
@GenerateMocks([AuthRepository])
import 'login_usecase_test.mocks.dart';

void main() {
  late LoginUseCase loginUseCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUseCase = LoginUseCase(mockAuthRepository);
  });

  group('LoginUseCase', () {
    const email = 'test@example.com';
    const password = 'password123';

    final loginRequest = LoginRequest(
      email: email,
      password: password,
      rememberMe: false,
    );

    final authResponse = AuthResponse(
      accessToken: 'access_token',
      refreshToken: 'refresh_token',
      user: UserProfile(
        id: '1',
        email: email,
        firstName: 'Test',
        lastName: 'User',
        username: 'testuser',
        avatar: null,
        bio: null,
        emailVerified: true,
        lastLogin: DateTime.now(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      expiresIn: 3600,
    );

    test('should return AuthResponse when login is successful', () async {
      // Arrange
      when(
        mockAuthRepository.login(loginRequest),
      ).thenAnswer((_) async => Right(authResponse));

      // Act
      final result = await loginUseCase(loginRequest);

      // Assert
      expect(result, Right(authResponse));
      verify(mockAuthRepository.login(loginRequest));
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should return failure when login fails', () async {
      // Arrange
      const failure = ServerFailure(message: 'Invalid credentials');
      when(
        mockAuthRepository.login(loginRequest),
      ).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await loginUseCase(loginRequest);

      // Assert
      expect(result, const Left(failure));
      verify(mockAuthRepository.login(loginRequest));
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}
