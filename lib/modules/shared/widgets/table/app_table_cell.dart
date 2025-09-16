import 'package:flutter/material.dart';

class AppTableCell extends StatelessWidget {
  final String label;
  const AppTableCell({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
        ),
      ),
    );
  }
}
