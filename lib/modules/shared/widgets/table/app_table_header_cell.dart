import 'package:flutter/material.dart';

class AppTableHeaderCell extends StatelessWidget {
  final String label;
  const AppTableHeaderCell({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ),
    );
  }
}
