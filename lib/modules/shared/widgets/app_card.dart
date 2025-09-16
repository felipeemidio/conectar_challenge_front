import 'package:conectar_challenge_front/core/consts/app_colors.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final double? maxWidth;
  final Widget child;
  const AppCard({super.key, required this.child, this.maxWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      constraints: maxWidth == null ? null : BoxConstraints(maxWidth: maxWidth!),
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }
}
