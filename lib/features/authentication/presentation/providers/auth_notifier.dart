import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/auth_state.dart';
import '../../domain/entities/auth_request.dart';
import '../../domain/usecases/auth_usecases.dart';
import '../providers/auth_providers.dart';

// Auth Notifier for managing overall authentication state
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier({
    required this.checkAuthStatusUseCase,
    required this.getCurrentUserUseCase,
    required this.logoutUseCase,
  }) : super(const AuthState.initial()) {
    _checkInitialAuthStatus();
  }

  final CheckAuthStatusUseCase checkAuthStatusUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final LogoutUseCase logoutUseCase;

  Future<void> _checkInitialAuthStatus() async {
    state = const AuthState.loading();

    try {
      final isLoggedIn = await checkAuthStatusUseCase();

      if (isLoggedIn) {
        final userResult = await getCurrentUserUseCase();
        userResult.fold(
          (failure) => state = const AuthState.unauthenticated(),
          (user) => state = AuthState.authenticated(
            userId: user.id,
            email: user.email,
            firstName: user.firstName,
            lastName: user.lastName,
            username: user.username,
            avatar: user.avatar,
          ),
        );
      } else {
        state = const AuthState.unauthenticated();
      }
    } catch (e) {
      state = const AuthState.unauthenticated();
    }
  }

  Future<void> logout() async {
    state = const AuthState.loading();
    final result = await logoutUseCase();
    result.fold(
      (failure) => state = AuthState.error(message: failure.message),
      (_) => state = const AuthState.unauthenticated(),
    );
  }

  void setAuthenticated({
    required String userId,
    required String email,
    String? firstName,
    String? lastName,
    String? username,
    String? avatar,
  }) {
    state = AuthState.authenticated(
      userId: userId,
      email: email,
      firstName: firstName,
      lastName: lastName,
      username: username,
      avatar: avatar,
    );
  }
}

// Login Notifier
class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier({required this.loginUseCase, required this.authNotifier})
    : super(const LoginState.initial());

  final LoginUseCase loginUseCase;
  final AuthNotifier authNotifier;

  Future<void> login({
    required String email,
    required String password,
    bool rememberMe = false,
  }) async {
    state = const LoginState.loading();

    final request = LoginRequest(
      email: email,
      password: password,
      rememberMe: rememberMe,
    );

    final result = await loginUseCase(request);

    result.fold(
      (failure) => state = LoginState.error(
        message: failure.message,
        code: failure.code,
      ),
      (authResponse) {
        state = const LoginState.success();
        // Update the global auth state
        authNotifier.setAuthenticated(
          userId: authResponse.user.id,
          email: authResponse.user.email,
          firstName: authResponse.user.firstName,
          lastName: authResponse.user.lastName,
          username: authResponse.user.username,
          avatar: authResponse.user.avatar,
        );
      },
    );
  }

  void resetState() {
    state = const LoginState.initial();
  }
}

// Register Notifier
class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier({required this.registerUseCase, required this.authNotifier})
    : super(const RegisterState.initial());

  final RegisterUseCase registerUseCase;
  final AuthNotifier authNotifier;

  Future<void> register({
    required String email,
    required String password,
    required String confirmPassword,
    String? firstName,
    String? lastName,
    String? username,
  }) async {
    state = const RegisterState.loading();

    final request = RegisterRequest(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      firstName: firstName,
      lastName: lastName,
      username: username,
    );

    final result = await registerUseCase(request);

    result.fold(
      (failure) => state = RegisterState.error(
        message: failure.message,
        code: failure.code,
      ),
      (authResponse) {
        state = const RegisterState.success();
        // Update the global auth state
        authNotifier.setAuthenticated(
          userId: authResponse.user.id,
          email: authResponse.user.email,
          firstName: authResponse.user.firstName,
          lastName: authResponse.user.lastName,
          username: authResponse.user.username,
          avatar: authResponse.user.avatar,
        );
      },
    );
  }

  void resetState() {
    state = const RegisterState.initial();
  }
}

// Forgot Password Notifier
class ForgotPasswordNotifier extends StateNotifier<ForgotPasswordState> {
  ForgotPasswordNotifier({required this.forgotPasswordUseCase})
    : super(const ForgotPasswordState.initial());

  final ForgotPasswordUseCase forgotPasswordUseCase;

  Future<void> forgotPassword({required String email}) async {
    state = const ForgotPasswordState.loading();

    final request = ForgotPasswordRequest(email: email);
    final result = await forgotPasswordUseCase(request);

    result.fold(
      (failure) => state = ForgotPasswordState.error(
        message: failure.message,
        code: failure.code,
      ),
      (_) => state = const ForgotPasswordState.success(),
    );
  }

  void resetState() {
    state = const ForgotPasswordState.initial();
  }
}

// Providers
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((
  ref,
) {
  return AuthNotifier(
    checkAuthStatusUseCase: ref.read(checkAuthStatusUseCaseProvider),
    getCurrentUserUseCase: ref.read(getCurrentUserUseCaseProvider),
    logoutUseCase: ref.read(logoutUseCaseProvider),
  );
});

final loginNotifierProvider = StateNotifierProvider<LoginNotifier, LoginState>((
  ref,
) {
  return LoginNotifier(
    loginUseCase: ref.read(loginUseCaseProvider),
    authNotifier: ref.read(authNotifierProvider.notifier),
  );
});

final registerNotifierProvider =
    StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
      return RegisterNotifier(
        registerUseCase: ref.read(registerUseCaseProvider),
        authNotifier: ref.read(authNotifierProvider.notifier),
      );
    });

final forgotPasswordNotifierProvider =
    StateNotifierProvider<ForgotPasswordNotifier, ForgotPasswordState>((ref) {
      return ForgotPasswordNotifier(
        forgotPasswordUseCase: ref.read(forgotPasswordUseCaseProvider),
      );
    });
