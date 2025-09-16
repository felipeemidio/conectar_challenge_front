import 'package:conectar_challenge_front/core/consts/app_routes.dart';
import 'package:conectar_challenge_front/modules/home/data/repositories/customers_repository.dart';
import 'package:conectar_challenge_front/modules/home/presenters/customers_list/customers_list_page.dart';
import 'package:conectar_challenge_front/modules/home/presenters/register_customer/register_customer_page.dart';
import 'package:conectar_challenge_front/modules/login/data/repositories/auth_repository.dart';
import 'package:conectar_challenge_front/modules/shared/shared_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [SharedModule()];

  @override
  void binds(Injector i) {
    i.add(AuthRepository.new);
    i.add(CustomersRepository.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.customersListSuffix, child: (context) => const CustomersListPage());
    r.child(AppRoutes.registerCustomerSuffix, child: (context) => const RegisterCustomerPage());
  }
}
