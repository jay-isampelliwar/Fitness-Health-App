import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Helper {
  static bool isDarkTheme(context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static String formatValue(String amount) {
    String cleanedValue = amount.replaceAll(RegExp(r'[^0-9]'), '');
    int value = int.tryParse(cleanedValue) ?? 0;
    String formattedValue = NumberFormat('#,##,###').format(value);
    return formattedValue;
  }
}
