import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class AppUtils {
  static Future<void> snackbar(BuildContext? context,
      {String? title, required String? message, bool error = false}) {
    return Flushbar(
      title: error ? 'Oopss!' : 'Great!',
      titleColor: Colors.white,
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      duration: const Duration(seconds: 5),
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: error ? Colors.red : Colors.green,
    ).show(context!);
  }
}
