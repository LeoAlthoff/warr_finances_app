import 'package:intl/intl.dart';

String getCurrency(dynamic value) {
  NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
  return formatter.format(value);
}
