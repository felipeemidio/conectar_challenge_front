import 'package:brasil_fields/brasil_fields.dart';
import 'package:conectar_challenge_front/modules/home/entities/filter_customer_dto.dart';
import 'package:conectar_challenge_front/modules/shared/widgets/app_button.dart';
import 'package:conectar_challenge_front/modules/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class FilterPanelContent extends StatefulWidget {
  final void Function(FilterCustomerDto filter) onFilter;
  const FilterPanelContent({super.key, required this.onFilter});

  @override
  State<FilterPanelContent> createState() => _FilterPanelContentState();
}

class _FilterPanelContentState extends State<FilterPanelContent> {
  final nameFieldController = TextEditingController();
  final cnpjFieldController = TextEditingController();
  bool? isActive;
  DateTime? selectedDate;

  @override
  void dispose() {
    nameFieldController.dispose();
    cnpjFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ResponsiveGridList(
          horizontalGridSpacing: 16,
          verticalGridSpacing: 16,
          horizontalGridMargin: 50,
          verticalGridMargin: 50,
          minItemWidth: 200,
          minItemsPerRow: 1,
          maxItemsPerRow: 4,
          listViewBuilderOptions: ListViewBuilderOptions(
            shrinkWrap: true,
          ),
          children: [
            AppTextField(controller: nameFieldController, label: "Nome"),
            AppTextField(
              controller: cnpjFieldController,
              label: "CNPJ",
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CnpjInputFormatter(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: DropdownButton<bool?>(
                value: isActive,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: null,
                    child: Text("Sem prefrência"),
                  ),
                  DropdownMenuItem(
                    value: true,
                    child: Text("Ativos"),
                  ),
                  DropdownMenuItem(
                    value: false,
                    child: Text("Inativos"),
                  ),
                ],
                onChanged: (value) {
                  setState(() => isActive = value);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                spacing: 16,
                children: [
                  Expanded(child: Text(selectedDate == null ? "Sem data" : DateFormat.yMd().format(selectedDate!))),
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        ).then((value) => setState(() => selectedDate = value));
                      },
                      icon: const Icon(Icons.date_range),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton(
                label: "Limpar",
                color: Colors.grey,
                onPressed: () {
                  nameFieldController.clear();
                  cnpjFieldController.clear();
                  isActive = null;
                  selectedDate = null;
                  setState(() {});
                  widget.onFilter(const FilterCustomerDto());
                },
              ),
              AppButton(
                label: "Filtrar",
                onPressed: () {
                  final name = nameFieldController.text.trim();
                  final cnpj = cnpjFieldController.text.trim();
                  widget.onFilter(
                    FilterCustomerDto(
                      name: name.isEmpty ? null : name,
                      cnpj: cnpj.isEmpty ? null : cnpj,
                      isActive: isActive,
                      startDate: selectedDate,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
