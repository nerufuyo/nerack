/// Environment-specific configuration
class EnvConfig {
  // Prevent instantiation
  EnvConfig._();

  /// Base URL for API endpoints
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://localhost:3000/api/v1',
  );

  /// API timeout duration in milliseconds
  static const String apiTimeout = String.fromEnvironment(
    'API_TIMEOUT',
    defaultValue: '30000',
  );

  /// Environment type (development, staging, production)
  static const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'development',
  );

  /// Enable debug logging
  static const bool debugMode = bool.fromEnvironment(
    'DEBUG_MODE',
    defaultValue: true,
  );

  /// Firebase configuration
  static const String firebaseProjectId = String.fromEnvironment(
    'FIREBASE_PROJECT_ID',
    defaultValue: '',
  );

  /// Google Books API key
  static const String googleBooksApiKey = String.fromEnvironment(
    'GOOGLE_BOOKS_API_KEY',
    defaultValue: '',
  );

  /// Sentry DSN for error tracking
  static const String sentryDsn = String.fromEnvironment(
    'SENTRY_DSN',
    defaultValue: '',
  );

  /// Check if running in development environment
  static bool get isDevelopment => environment == 'development';

  /// Check if running in staging environment
  static bool get isStaging => environment == 'staging';

  /// Check if running in production environment
  static bool get isProduction => environment == 'production';

  /// Get API timeout as Duration
  static Duration get apiTimeoutDuration =>
      Duration(milliseconds: int.parse(apiTimeout));
}
