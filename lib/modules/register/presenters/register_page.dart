import 'package:conectar_challenge_front/core/consts/app_colors.dart';
import 'package:conectar_challenge_front/core/utils/app_snackbar_utils.dart';
import 'package:conectar_challenge_front/core/utils/app_validators.dart';
import 'package:conectar_challenge_front/modules/register/presenters/register_page_controller.dart';
import 'package:conectar_challenge_front/modules/shared/entities/user.dart';
import 'package:conectar_challenge_front/modules/shared/entities/user_create_dto.dart';
import 'package:conectar_challenge_front/modules/shared/widgets/app_button.dart';
import 'package:conectar_challenge_front/modules/shared/widgets/app_card.dart';
import 'package:conectar_challenge_front/modules/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _controller = RegisterPageController();

  final _formKey = GlobalKey<FormState>();
  final _nameFieldController = TextEditingController();
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();
  final _confirmPasswordFieldController = TextEditingController();

  void _handleTabSelection() {
    if (_tabController.index != 0) {
      // If the selected tab is disabled, revert to the previous tab
      int previousIndex = _tabController.previousIndex;
      setState(() {
        _tabController.index = previousIndex;
      });
    }
  }

  void _listenError() {
    final errorMessage = _controller.errorMessage.value;
    if (errorMessage.isNotEmpty) {
      AppSnackbarUtils.error(context, text: errorMessage);
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _controller.errorMessage.addListener(_listenError);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _controller.errorMessage.removeListener(_listenError);
    _tabController.dispose();
    _nameFieldController.dispose();
    _emailFieldController.dispose();
    _passwordFieldController.dispose();
    _confirmPasswordFieldController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Conéctar",
          style: TextStyle(color: AppColors.onPrimary, fontSize: 28),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                onTap: (value) {},
                tabs: const [
                  Tab(
                    text: "Dados Cadastrais",
                  ),
                  Tab(
                    text: "Informações internas",
                  ),
                  Tab(
                    text: "Usuários",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: AppCard(
                  maxWidth: 400,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 16,
                      children: [
                        AppTextField(
                          controller: _nameFieldController,
                          label: "Nome",
                          validator: AppValidators.required(),
                        ),
                        AppTextField(
                          controller: _emailFieldController,
                          label: "Email",
                          validator: AppValidators.required(),
                        ),
                        AppTextField(
                          controller: _passwordFieldController,
                          label: "Password",
                          obsecureText: true,
                          validator: AppValidators.required(),
                        ),
                        ValueListenableBuilder(
                          valueListenable: _passwordFieldController,
                          builder: (context, value, child) {
                            return AppTextField(
                              controller: _confirmPasswordFieldController,
                              label: "Confirm Password",
                              obsecureText: true,
                              validator: AppValidators.multiple([
                                AppValidators.required(),
                                AppValidators.compare(value.text.trim()),
                              ]),
                            );
                          },
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            ValueListenableBuilder(
                              valueListenable: _controller.isAdmin,
                              builder: (context, isAdmin, child) {
                                return Checkbox(
                                  value: isAdmin,
                                  onChanged: (value) => _controller.isAdmin.value = value ?? false,
                                );
                              },
                            ),
                            const Expanded(child: Text("É admin?")),
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
                                  final user = UserCreateDto(
                                    name: _nameFieldController.text.trim(),
                                    email: _emailFieldController.text.trim(),
                                    password: _passwordFieldController.text.trim(),
                                    role: _controller.isAdmin.value ? UserRole.admin : UserRole.user,
                                  );

                                  _controller.onSubmit(user);
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
