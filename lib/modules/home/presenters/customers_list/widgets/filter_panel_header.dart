import 'package:conectar_challenge_front/core/consts/app_colors.dart';
import 'package:flutter/material.dart';

class FilterPanelHeader extends StatelessWidget {
  const FilterPanelHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.search, color: AppColors.primary),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Filtros",

                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Filtre e busque itens na página",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black38,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
