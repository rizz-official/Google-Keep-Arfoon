import 'package:intl/intl.dart';

class GoogleKeepFormatter {
  static String formatDate(int milliseconds) {
    final now = DateTime.now();
    final date = DateTime.fromMillisecondsSinceEpoch(milliseconds);

    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));

    if (date.isAfter(today) && date.isBefore(tomorrow)) {
      return 'Today • ${DateFormat.jm().format(date)}'; // 'Today • 5:00 PM'
    } else if (date.isAfter(tomorrow) &&
        date.isBefore(tomorrow.add(const Duration(days: 1)))) {
      return 'Tomorrow • ${DateFormat.jm().format(date)}'; // 'Tomorrow • 5:00 PM'
    } else {
      return '${DateFormat('dd-MMM-yyyy').format(date)} • ${DateFormat.jm().format(date)}'; // '24-May-2024 • 5:00 PM'
    }
  }
}