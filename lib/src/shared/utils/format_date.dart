import 'package:intl/intl.dart';

String formatDate(String date) {
  DateTime? dateTime = DateTime.tryParse(date);

  return dateTime != null
      ? DateFormat.yMMMd('pt_BR').format(dateTime)
      : 'DataDesconhecida';
}
