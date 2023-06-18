import 'package:flutter/material.dart';

import 'text.dart';

class SnackBarMessageCall {
  static show({
    required String message,
    required Color? backgroundColor,
    required Color? textColor,
    required Color? buttonColor,
    int seconds = 1,
  }) {
    final snackBar = SnackBar(
      content: TextCall(
        text: message,
        size: 20,
        color: textColor,
      ),
      duration: Duration(seconds: seconds),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      clipBehavior: Clip.none,
      dismissDirection: DismissDirection.horizontal,
    );
    return snackBar;
  }
}
