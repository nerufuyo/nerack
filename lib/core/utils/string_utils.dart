import 'dart:math';

/// Utility class for string operations
class StringUtils {
  StringUtils._();

  /// Check if string is null or empty
  static bool isNullOrEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  /// Check if string is null, empty, or whitespace only
  static bool isNullOrWhitespace(String? value) {
    return value == null || value.trim().isEmpty;
  }

  /// Capitalize first letter of string
  static String capitalize(String value) {
    if (value.isEmpty) return value;
    return value[0].toUpperCase() + value.substring(1).toLowerCase();
  }

  /// Capitalize first letter of each word
  static String capitalizeWords(String value) {
    if (value.isEmpty) return value;
    return value.split(' ').map((word) => capitalize(word)).join(' ');
  }

  /// Truncate string with ellipsis
  static String truncate(String value, int maxLength, {String suffix = '...'}) {
    if (value.length <= maxLength) return value;
    return value.substring(0, maxLength - suffix.length) + suffix;
  }

  /// Remove HTML tags from string
  static String removeHtmlTags(String value) {
    final RegExp htmlTagRegExp = RegExp(r'<[^>]*>');
    return value.replaceAll(htmlTagRegExp, '');
  }

  /// Extract initials from name
  static String getInitials(String name, {int maxInitials = 2}) {
    if (name.isEmpty) return '';

    final words = name.trim().split(RegExp(r'\s+'));
    final initials = words
        .take(maxInitials)
        .map((word) => word.isNotEmpty ? word[0].toUpperCase() : '')
        .where((initial) => initial.isNotEmpty)
        .join();

    return initials;
  }

  /// Generate random string
  static String generateRandomString(int length) {
    const String chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final Random random = Random();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(random.nextInt(chars.length)),
      ),
    );
  }

  /// Check if string is valid email
  static bool isValidEmail(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }

  /// Check if string is valid password
  static bool isValidPassword(
    String password, {
    int minLength = 8,
    bool requireUppercase = true,
    bool requireLowercase = true,
    bool requireNumbers = true,
    bool requireSpecialChars = true,
  }) {
    if (password.length < minLength) return false;

    if (requireUppercase && !password.contains(RegExp(r'[A-Z]'))) {
      return false;
    }

    if (requireLowercase && !password.contains(RegExp(r'[a-z]'))) {
      return false;
    }

    if (requireNumbers && !password.contains(RegExp(r'[0-9]'))) {
      return false;
    }

    if (requireSpecialChars &&
        !password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return false;
    }

    return true;
  }

  /// Convert string to slug (URL-friendly)
  static String toSlug(String value) {
    return value
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9\s-]'), '')
        .replaceAll(RegExp(r'\s+'), '-')
        .replaceAll(RegExp(r'-+'), '-')
        .replaceAll(RegExp(r'^-|-$'), '');
  }

  /// Mask sensitive data
  static String maskData(
    String value, {
    int visibleStart = 2,
    int visibleEnd = 2,
    String maskChar = '*',
  }) {
    if (value.length <= visibleStart + visibleEnd) {
      return maskChar * value.length;
    }

    final start = value.substring(0, visibleStart);
    final end = value.substring(value.length - visibleEnd);
    final masked = maskChar * (value.length - visibleStart - visibleEnd);

    return start + masked + end;
  }

  /// Count words in string
  static int countWords(String value) {
    if (value.trim().isEmpty) return 0;
    return value.trim().split(RegExp(r'\s+')).length;
  }

  /// Estimate reading time
  static int estimateReadingTime(String text, {int wordsPerMinute = 200}) {
    final wordCount = countWords(text);
    return (wordCount / wordsPerMinute).ceil();
  }

  /// Format file size
  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024)
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  /// Remove extra whitespace
  static String cleanWhitespace(String value) {
    return value.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  /// Check if string contains only digits
  static bool isNumeric(String value) {
    return RegExp(r'^[0-9]+$').hasMatch(value);
  }

  /// Validate ISBN format
  static bool isValidISBN(String isbn) {
    // Remove hyphens and spaces
    final cleanISBN = isbn.replaceAll(RegExp(r'[-\s]'), '');

    // Check for ISBN-10 or ISBN-13
    if (cleanISBN.length == 10) {
      return _isValidISBN10(cleanISBN);
    } else if (cleanISBN.length == 13) {
      return _isValidISBN13(cleanISBN);
    }

    return false;
  }

  static bool _isValidISBN10(String isbn) {
    if (!RegExp(r'^[0-9]{9}[0-9X]$').hasMatch(isbn)) return false;

    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += int.parse(isbn[i]) * (10 - i);
    }

    final checkDigit = isbn[9];
    final expectedCheckDigit = (11 - (sum % 11)) % 11;

    if (expectedCheckDigit == 10) {
      return checkDigit == 'X';
    } else {
      return checkDigit == expectedCheckDigit.toString();
    }
  }

  static bool _isValidISBN13(String isbn) {
    if (!RegExp(r'^[0-9]{13}$').hasMatch(isbn)) return false;

    int sum = 0;
    for (int i = 0; i < 12; i++) {
      final digit = int.parse(isbn[i]);
      sum += (i % 2 == 0) ? digit : digit * 3;
    }

    final checkDigit = int.parse(isbn[12]);
    final expectedCheckDigit = (10 - (sum % 10)) % 10;

    return checkDigit == expectedCheckDigit;
  }
}
