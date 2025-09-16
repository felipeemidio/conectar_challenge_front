import 'package:conectar_challenge_front/core/consts/app_routes.dart';
import 'package:conectar_challenge_front/modules/home/data/repositories/customers_repository.dart';
import 'package:conectar_challenge_front/modules/home/entities/customer_create_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterCustomerPageController {
  final _customersRepository = Modular.get<CustomersRepository>();

  ValueNotifier<bool> isPublic = ValueNotifier<bool>(true);
  ValueNotifier<bool> isActive = ValueNotifier<bool>(true);
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  ValueNotifier<String> errorMessage = ValueNotifier<String>('');

  void dispose() {
    isLoading.dispose();
    errorMessage.dispose();
    isPublic.dispose();
    isActive.dispose();
  }

  Future<void> onSubmit(CustomerCreateDto customerDto) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      await _customersRepository.create(customerDto);
      isLoading.value = false;
      Modular.to.navigate(AppRoutes.customersList);
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = e.toString();
    }
  }
}
