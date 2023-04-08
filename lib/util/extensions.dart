import 'dart:ui';

import 'package:intl/intl.dart';

extension HexColor on String {
  Color toColor() {
    final hexCode = replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}

extension CaseConverter on String {
  String toCapitalCase() {
    if (isEmpty) {
      return '';
    }

    String firstLetter = this[0].toUpperCase();
    String restOfText = substring(1);
    return '$firstLetter$restOfText'.replaceAllMapped(
        RegExp(r'(?<=\s)\w'), (match) => '${match.group(0)?[0].toUpperCase()}${match.group(0)?.substring(1)}');
  }
}

extension CurrencyConverter on double {
  String toCurrency(String symbol) {
    return NumberFormat.currency(locale: 'en_US', symbol: symbol).format(this);
  }
}

extension ValidatorNull on String? {
  bool get isNull => this == null;
}

extension Validator on String {
  bool get isValidEmail =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
}
