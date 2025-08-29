import 'package:intl/intl.dart';

/// Utility class for date and time operations
class DateTimeUtils {
  DateTimeUtils._();

  /// Format DateTime to readable string
  static String formatDateTime(DateTime dateTime, {String? pattern}) {
    final formatter = DateFormat(pattern ?? 'MMM dd, yyyy HH:mm');
    return formatter.format(dateTime);
  }

  /// Format DateTime to date only
  static String formatDate(DateTime dateTime, {String? pattern}) {
    final formatter = DateFormat(pattern ?? 'MMM dd, yyyy');
    return formatter.format(dateTime);
  }

  /// Format DateTime to time only
  static String formatTime(DateTime dateTime, {String? pattern}) {
    final formatter = DateFormat(pattern ?? 'HH:mm');
    return formatter.format(dateTime);
  }

  /// Get relative time string (e.g., "2 hours ago")
  static String getRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks week${weeks == 1 ? '' : 's'} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months month${months == 1 ? '' : 's'} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years year${years == 1 ? '' : 's'} ago';
    }
  }

  /// Check if date is today
  static bool isToday(DateTime dateTime) {
    final now = DateTime.now();
    return dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day;
  }

  /// Check if date is yesterday
  static bool isYesterday(DateTime dateTime) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return dateTime.year == yesterday.year &&
        dateTime.month == yesterday.month &&
        dateTime.day == yesterday.day;
  }

  /// Get start of day
  static DateTime startOfDay(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  /// Get end of day
  static DateTime endOfDay(DateTime dateTime) {
    return DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      23,
      59,
      59,
      999,
    );
  }

  /// Get start of week (Monday)
  static DateTime startOfWeek(DateTime dateTime) {
    final daysToMonday = dateTime.weekday - 1;
    return startOfDay(dateTime.subtract(Duration(days: daysToMonday)));
  }

  /// Get end of week (Sunday)
  static DateTime endOfWeek(DateTime dateTime) {
    final daysToSunday = 7 - dateTime.weekday;
    return endOfDay(dateTime.add(Duration(days: daysToSunday)));
  }

  /// Get start of month
  static DateTime startOfMonth(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, 1);
  }

  /// Get end of month
  static DateTime endOfMonth(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month + 1, 0, 23, 59, 59, 999);
  }

  /// Get start of year
  static DateTime startOfYear(DateTime dateTime) {
    return DateTime(dateTime.year, 1, 1);
  }

  /// Get end of year
  static DateTime endOfYear(DateTime dateTime) {
    return DateTime(dateTime.year, 12, 31, 23, 59, 59, 999);
  }

  /// Parse ISO string to DateTime
  static DateTime? parseISOString(String? isoString) {
    if (isoString == null || isoString.isEmpty) return null;
    try {
      return DateTime.parse(isoString);
    } catch (e) {
      return null;
    }
  }

  /// Convert DateTime to ISO string
  static String toISOString(DateTime dateTime) {
    return dateTime.toIso8601String();
  }

  /// Calculate reading time in minutes
  static int calculateReadingTime(int wordCount, {int wordsPerMinute = 200}) {
    return (wordCount / wordsPerMinute).ceil();
  }

  /// Format duration to readable string
  static String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else if (minutes > 0) {
      return '${minutes}m ${seconds}s';
    } else {
      return '${seconds}s';
    }
  }
}
