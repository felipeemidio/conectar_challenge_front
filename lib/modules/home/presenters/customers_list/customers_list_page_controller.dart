import 'package:conectar_challenge_front/modules/login/data/repositories/auth_repository.dart';
import 'package:conectar_challenge_front/modules/shared/entities/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomersListPageController {
  final _authRespository = Modular.get<AuthRepository>();

  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  ValueNotifier<String> errorMessage = ValueNotifier<String>('');
  ValueNotifier<User?> user = ValueNotifier<User?>(null);

  dispose() {
    isLoading.dispose();
    user.dispose();
    errorMessage.dispose();
  }

  Future<void> loadUser() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final user = await _authRespository.getProfile();
      this.user.value = user;
    } catch (e) {
      errorMessage.value = e.toString();
    }
    isLoading.value = false;
  }
}
