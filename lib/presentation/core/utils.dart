import 'package:intl/intl.dart';

String getStringInCurrencyFormat(int price) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: 'IDR ',
    decimalDigits: 0,
  ).format(price);
}
