import 'package:conectar_challenge_front/core/consts/app_colors.dart';
import 'package:conectar_challenge_front/core/consts/app_routes.dart';
import 'package:conectar_challenge_front/core/utils/app_snackbar_utils.dart';
import 'package:conectar_challenge_front/core/utils/app_validators.dart';
import 'package:conectar_challenge_front/modules/login/presenters/login_page_controller.dart';
import 'package:conectar_challenge_front/modules/shared/widgets/app_button.dart';
import 'package:conectar_challenge_front/modules/shared/widgets/app_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _controller = LoginPageController();

  void _listenError() {
    final errorMessage = _controller.errorMessage.value;
    if (errorMessage.isNotEmpty) {
      AppSnackbarUtils.error(context, text: errorMessage);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.errorMessage.addListener(_listenError);

    if (kDebugMode) {
      _emailController.text = 'felipe.emidio@gmail.com';
      _passwordController.text = 'teste123';
    }
  }

  @override
  void dispose() {
    _controller.errorMessage.removeListener(_listenError);
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Conéctar', style: TextStyle(color: AppColors.onPrimary, fontSize: 48)),
            const SizedBox(height: 24),
            Container(
              constraints: const BoxConstraints(maxWidth: 440),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    AppTextField(
                      controller: _emailController,
                      label: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: AppValidators.required(),
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      controller: _passwordController,
                      label: 'Senha',
                      obsecureText: true,
                      validator: AppValidators.required(),
                    ),
                    const SizedBox(height: 24),
                    ValueListenableBuilder(
                      valueListenable: _controller.isLoading,
                      builder: (context, isLoading, child) {
                        return AppButton(
                          label: 'Entrar',
                          isLoading: isLoading,
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              _controller.onSubmit(_emailController.text.trim(), _passwordController.text.trim());
                            }
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            Modular.to.navigate(AppRoutes.register);
                          }
                        },
                        child: const Text(
                          'Criar Conta',
                          style: TextStyle(
                            color: AppColors.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
