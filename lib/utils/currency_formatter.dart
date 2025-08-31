import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyFormatter {
  static final NumberFormat _formatter = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );

  static String format(double value) {
    return _formatter.format(value);
  }

  static double parseToDouble(String value) {
    final cleanValue = value.replaceAll(RegExp(r'[^\d,]'), '').replaceAll(',', '.');
    return double.tryParse(cleanValue) ?? 0.0;
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final newText = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (newText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final double value = int.parse(newText) / 100.0;

    final formattedValue = CurrencyFormatter.format(value);

    return newValue.copyWith(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}