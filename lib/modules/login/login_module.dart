import 'package:conectar_challenge_front/core/consts/app_routes.dart';
import 'package:conectar_challenge_front/modules/login/data/repositories/auth_repository.dart';
import 'package:conectar_challenge_front/modules/login/presenters/login_page.dart';
import 'package:conectar_challenge_front/modules/shared/shared_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<Module> get imports => [SharedModule()];

  @override
  void binds(Injector i) {
    i.add(AuthRepository.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.loginSuffix, child: (context) => const LoginPage());
  }
}
