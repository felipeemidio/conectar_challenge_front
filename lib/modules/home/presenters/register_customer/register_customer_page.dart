import 'package:brasil_fields/brasil_fields.dart';
import 'package:conectar_challenge_front/core/utils/app_validators.dart';
import 'package:conectar_challenge_front/modules/home/entities/customer_create_dto.dart';
import 'package:conectar_challenge_front/modules/home/presenters/register_customer/register_customer_page_controller.dart';
import 'package:conectar_challenge_front/modules/shared/widgets/app_button.dart';
import 'package:conectar_challenge_front/modules/shared/widgets/app_card.dart';
import 'package:conectar_challenge_front/modules/shared/widgets/app_page_header.dart';
import 'package:conectar_challenge_front/modules/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterCustomerPage extends StatefulWidget {
  const RegisterCustomerPage({super.key});

  @override
  State<RegisterCustomerPage> createState() => _RegisterCustomerPageState();
}

class _RegisterCustomerPageState extends State<RegisterCustomerPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _controller = RegisterCustomerPageController();
  final _nameFieldcontroller = TextEditingController();
  final _cnpjFieldcontroller = TextEditingController();
  final _fantasyNameFieldcontroller = TextEditingController();

  @override
  void dispose() {
    _nameFieldcontroller.dispose();
    _cnpjFieldcontroller.dispose();
    _fantasyNameFieldcontroller.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AppPageHeader(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: AppCard(
                  maxWidth: 400,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 16,
                      children: [
                        AppTextField(
                          controller: _nameFieldcontroller,
                          label: 'Nome',
                          validator: AppValidators.required(),
                        ),
                        AppTextField(
                          controller: _cnpjFieldcontroller,
                          label: 'CNPJ',
                          validator: AppValidators.cnpj(),
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly, CnpjInputFormatter()],
                        ),
                        AppTextField(
                          controller: _fantasyNameFieldcontroller,
                          label: 'Nome fantasia',
                          validator: AppValidators.required(),
                        ),
                        Row(
                          spacing: 16,
                          children: [
                            ValueListenableBuilder(
                              valueListenable: _controller.isPublic,
                              builder: (context, isPublic, child) {
                                return Checkbox(
                                  value: isPublic,
                                  onChanged: (value) => _controller.isPublic.value = value ?? false,
                                );
                              },
                            ),
                            const Expanded(child: Text('Publico')),
                          ],
                        ),
                        Row(
                          spacing: 16,
                          children: [
                            ValueListenableBuilder(
                              valueListenable: _controller.isActive,
                              builder: (context, isActive, child) {
                                return Checkbox(
                                  value: isActive,
                                  onChanged: (value) => _controller.isActive.value = value ?? false,
                                );
                              },
                            ),
                            const Expanded(child: Text('Ativo')),
                          ],
                        ),
                        ValueListenableBuilder(
                          valueListenable: _controller.isLoading,
                          builder: (context, isLoading, child) {
                            return AppButton(
                              label: "Salvar",
                              isLoading: isLoading,
                              onPressed: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                  _controller.onSubmit(
                                    CustomerCreateDto(
                                      name: _nameFieldcontroller.text.trim(),
                                      cnpj: _cnpjFieldcontroller.text.trim(),
                                      fantasyName: _fantasyNameFieldcontroller.text.trim(),
                                      isPublic: _controller.isPublic.value,
                                      isActive: _controller.isActive.value,
                                    ),
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
