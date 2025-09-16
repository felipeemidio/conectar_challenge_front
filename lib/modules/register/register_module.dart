import 'package:conectar_challenge_front/core/consts/app_routes.dart';
import 'package:conectar_challenge_front/modules/register/presenters/register_page.dart';
import 'package:conectar_challenge_front/modules/shared/data/repositories/user_repository.dart';
import 'package:conectar_challenge_front/modules/shared/shared_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  @override
  List<Module> get imports => [SharedModule()];

  @override
  void binds(i) {
    i.add(UserRepository.new);
  }

  @override
  void routes(r) {
    r.child(AppRoutes.registerSuffix, child: (context) => const RegisterPage());
  }
}
