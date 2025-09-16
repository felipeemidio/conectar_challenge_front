import 'package:conectar_challenge_front/core/consts/app_colors.dart';
import 'package:conectar_challenge_front/core/consts/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppPageHeader extends StatefulWidget {
  const AppPageHeader({super.key});

  @override
  State<AppPageHeader> createState() => _AppPageHeaderState();
}

class _AppPageHeaderState extends State<AppPageHeader> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: double.infinity,
      color: AppColors.primary,
      padding: const EdgeInsets.only(top: 8, left: 24, right: 24, bottom: 0),
      child: Row(
        children: [
          const Text(
            "Conéctar",
            style: TextStyle(color: AppColors.onPrimary, fontSize: 28),
          ),
          const SizedBox(width: 24),
          SizedBox(
            width: 100,
            child: TabBar(
              controller: _tabController,
              indicatorPadding: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.label,
              dividerColor: AppColors.onPrimary,
              dividerHeight: 3,
              indicatorColor: AppColors.onPrimary,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(width: 3, color: AppColors.onPrimary),
                insets: EdgeInsets.zero,
              ),
              labelPadding: const EdgeInsets.only(right: 8),
              labelStyle: const TextStyle(color: AppColors.onPrimary, fontWeight: FontWeight.w500),
              tabs: const [
                Tab(
                  text: "Clientes",
                ),
              ],
              onTap: (value) {
                if (value == 0) {
                  Modular.to.navigate(AppRoutes.customersList);
                }
              },
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.help_outline,
              color: AppColors.onPrimary,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: AppColors.onPrimary,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: AppColors.onPrimary,
            ),
            onPressed: () {
              Modular.to.navigate(AppRoutes.login);
            },
          ),
        ],
      ),
    );
  }
}
