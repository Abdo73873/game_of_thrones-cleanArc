import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants {
  static void showErrorDialog({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          message,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context),
              child: const Text('OK',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          )),
        ],
      ),
    );
  }

  static void showToast({
    required BuildContext context,
    required String message,
    MaterialColor? color,
}){}
}
