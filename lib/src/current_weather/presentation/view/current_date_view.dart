import 'package:intl/intl.dart';

extension FormattedNow on DateTime {
  String get formatted => DateFormat.yMMMd().format(this);
}
