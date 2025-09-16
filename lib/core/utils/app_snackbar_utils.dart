import 'package:flutter/material.dart';

class AppSnackbarUtils {
  static error(BuildContext context, {required String text}) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: TextStyle(color: Theme.of(context).colorScheme.error),
      ),
      backgroundColor: Theme.of(context).colorScheme.errorContainer,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static info(BuildContext context, {required String text}) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
