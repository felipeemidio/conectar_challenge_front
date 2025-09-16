import 'package:conectar_challenge_front/modules/home/data/repositories/customers_repository.dart';
import 'package:conectar_challenge_front/modules/home/entities/customer.dart';
import 'package:conectar_challenge_front/modules/home/entities/filter_customer_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BasicDataViewController {
  final _customersRepository = Modular.get<CustomersRepository>();

  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  ValueNotifier<String> errorMessage = ValueNotifier<String>('');
  ValueNotifier<bool> isFilterExpanded = ValueNotifier<bool>(false);
  ValueNotifier<List<Customer>> customers = ValueNotifier<List<Customer>>([]);

  dispose() {
    isLoading.dispose();
    errorMessage.dispose();
    customers.dispose();
  }

  Future<void> loadData({FilterCustomerDto? filters}) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final customers = await _customersRepository.getCustomers(filters: filters);
      this.customers.value = customers;
    } catch (e) {
      errorMessage.value = e.toString();
    }
    isLoading.value = false;
  }
}
