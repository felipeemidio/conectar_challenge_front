import 'package:conectar_challenge_front/modules/home/presenters/customers_list/customers_list_page_controller.dart';
import 'package:conectar_challenge_front/modules/home/presenters/customers_list/views/basic_data_view.dart';
import 'package:conectar_challenge_front/modules/shared/widgets/app_page_header.dart';
import 'package:flutter/material.dart';

class CustomersListPage extends StatefulWidget {
  const CustomersListPage({super.key});

  @override
  State<CustomersListPage> createState() => _CustomersListPageState();
}

class _CustomersListPageState extends State<CustomersListPage> {
  final _controller = CustomersListPageController();

  @override
  void initState() {
    super.initState();
    _controller.loadUser();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppPageHeader(),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _controller.isLoading,
              builder: (context, isLoading, child) {
                if (isLoading) {
                  return const Align(
                    alignment: Alignment.topCenter,
                    child: LinearProgressIndicator(),
                  );
                }
                return const BasicDataView();
              },
            ),
          ),
        ],
      ),
    );
  }
}
