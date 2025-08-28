/// Application-wide constants and configuration values
class AppConstants {
  // Prevent instantiation
  AppConstants._();

  // App Information
  static const String appName = 'Nerack';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Personal Bookshelf Management Application';

  // API Configuration
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://localhost:3000/api/v1',
  );

  static const int apiTimeoutDuration = int.fromEnvironment(
    'API_TIMEOUT',
    defaultValue: 30000,
  );

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Local Storage Keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userDataKey = 'user_data';
  static const String appSettingsKey = 'app_settings';

  // Database Configuration
  static const String databaseName = 'nerack_local.db';
  static const int databaseVersion = 1;

  // Cache Configuration
  static const Duration cacheExpiration = Duration(hours: 24);
  static const Duration shortCacheExpiration = Duration(minutes: 15);

  // Authentication
  static const Duration tokenRefreshThreshold = Duration(minutes: 5);
  static const int maxLoginAttempts = 5;
  static const Duration loginLockoutDuration = Duration(minutes: 15);

  // File Upload
  static const int maxFileSize = 10 * 1024 * 1024; // 10MB
  static const List<String> allowedImageExtensions = ['jpg', 'jpeg', 'png', 'webp'];

  // Reading Session
  static const Duration minReadingSessionDuration = Duration(minutes: 1);
  static const Duration autoSaveInterval = Duration(seconds: 30);

  // Social Features
  static const int maxFriendsCount = 1000;
  static const int maxGroupMembersCount = 100;
  static const int maxMessageLength = 1000;

  // Notification Settings
  static const String notificationChannelId = 'nerack_notifications';
  static const String notificationChannelName = 'Nerack Notifications';
  static const String notificationChannelDescription = 'Notifications for reading reminders and updates';

  // Error Messages
  static const String genericErrorMessage = 'Something went wrong. Please try again.';
  static const String networkErrorMessage = 'Please check your internet connection and try again.';
  static const String unauthorizedErrorMessage = 'Your session has expired. Please log in again.';
}
