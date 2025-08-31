
import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        final minutes = difference.inMinutes;
        return '$minutes min atrás';
      }
      final hours = difference.inHours;
      return '${hours}h atrás';
    } else if (difference.inDays == 1) {
      final timeFormatter = DateFormat('HH:mm');
      return 'Ontem às ${timeFormatter.format(dateTime)}';
    } else if (difference.inDays < 7) {
      final days = difference.inDays;
      return '$days dias atrás';
    } else {
      final fullFormatter = DateFormat('dd/MM/yyyy HH:mm');
      return fullFormatter.format(dateTime);
    }
  }
}