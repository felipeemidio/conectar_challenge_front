import 'package:conectar_challenge_front/core/consts/app_routes.dart';
import 'package:conectar_challenge_front/modules/home/home_module.dart';
import 'package:conectar_challenge_front/modules/login/login_module.dart';
import 'package:conectar_challenge_front/modules/register/register_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainModule extends Module {
  @override
  void routes(r) {
    r.redirect('/', to: AppRoutes.login);
    r.module(AppRoutes.loginModule, module: LoginModule());
    r.module(AppRoutes.registerModule, module: RegisterModule());
    r.module(AppRoutes.homeModule, module: HomeModule());
  }
}
