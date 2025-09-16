import 'package:conectar_challenge_front/core/consts/app_colors.dart';
import 'package:conectar_challenge_front/core/consts/app_routes.dart';
import 'package:conectar_challenge_front/modules/home/presenters/customers_list/views/basic_data_view_controller.dart';
import 'package:conectar_challenge_front/modules/home/presenters/customers_list/widgets/filter_panel_content.dart';
import 'package:conectar_challenge_front/modules/home/presenters/customers_list/widgets/filter_panel_header.dart';
import 'package:conectar_challenge_front/modules/shared/widgets/app_card.dart';
import 'package:conectar_challenge_front/modules/shared/widgets/table/app_table_cell.dart';
import 'package:conectar_challenge_front/modules/shared/widgets/table/app_table_header_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BasicDataView extends StatefulWidget {
  const BasicDataView({super.key});

  @override
  State<BasicDataView> createState() => _BasicDataViewState();
}

class _BasicDataViewState extends State<BasicDataView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _controller = BasicDataViewController();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
    _controller.loadData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: AppColors.white,
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: _tabController,
                dividerHeight: 0,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2, color: Colors.black),
                  insets: EdgeInsets.zero,
                ),

                labelStyle: const TextStyle(color: Colors.black),
                tabs: [
                  const Tab(
                    text: "Dados Básicos",
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    AppCard(
                      child: ValueListenableBuilder(
                        valueListenable: _controller.isFilterExpanded,
                        builder: (context, isFilterExpanded, child) {
                          return ExpansionPanelList(
                            elevation: 0,
                            expandedHeaderPadding: EdgeInsets.zero,
                            expandIconColor: AppColors.primary,
                            expansionCallback: (index, isExpanded) {
                              _controller.isFilterExpanded.value = isExpanded;
                            },
                            children: [
                              ExpansionPanel(
                                canTapOnHeader: true,
                                backgroundColor: AppColors.background,
                                isExpanded: isFilterExpanded,
                                headerBuilder: (context, isExpanded) {
                                  return const FilterPanelHeader();
                                },
                                body: Container(
                                  color: AppColors.white,
                                  child: FilterPanelContent(
                                    onFilter: (filters) {
                                      _controller.loadData(filters: filters);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    AppCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            "Clientes",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "Selecione um usuário para editar suas informações",
                            style: TextStyle(color: Colors.black38, fontSize: 12),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: OutlinedButton(
                                onPressed: () {
                                  Modular.to.navigate(AppRoutes.registerCustomer);
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Colors.black, width: 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  shadowColor: Colors.black,
                                  elevation: 2,
                                  backgroundColor: AppColors.white,
                                ),
                                child: const Text(
                                  "Novo",
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          ValueListenableBuilder(
                            valueListenable: _controller.isLoading,
                            builder: (context, isLoading, child) {
                              if (isLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return ValueListenableBuilder(
                                valueListenable: _controller.customers,
                                builder: (context, customers, child) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Table(
                                        children: [
                                          TableRow(
                                            decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.2)),
                                            children: const [
                                              AppTableHeaderCell(label: 'Razão social'),
                                              AppTableHeaderCell(label: 'CNPJ'),
                                              AppTableHeaderCell(label: 'Nome na fachada'),
                                              AppTableHeaderCell(label: 'Tags'),
                                              AppTableHeaderCell(label: 'Status'),
                                              AppTableHeaderCell(label: 'Conecta Plus'),
                                            ],
                                          ),
                                          ...customers.map(
                                            (customer) => TableRow(
                                              children: [
                                                AppTableCell(
                                                  label: customer.name,
                                                ),
                                                AppTableCell(
                                                  label: customer.cnpj,
                                                ),
                                                AppTableCell(
                                                  label: customer.fantasyName,
                                                ),
                                                const AppTableCell(label: ""),
                                                AppTableCell(label: customer.isActive ? "Ativo" : "Inativo"),
                                                AppTableCell(label: customer.isPublic ? "Sim" : "Não"),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (customers.isEmpty)
                                        const Padding(
                                          padding: EdgeInsets.all(16),
                                          child: Text("Sem clientes"),
                                        ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
