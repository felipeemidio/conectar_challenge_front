import 'package:conectar_challenge_front/core/consts/app_routes.dart';
import 'package:conectar_challenge_front/modules/login/data/repositories/auth_repository.dart';
import 'package:conectar_challenge_front/modules/shared/data/services/local_storage_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPageController {
  final AuthRepository _authRepository = Modular.get();
  final LocalStorageService _localStorage = Modular.get();

  final isLoading = ValueNotifier<bool>(false);
  final errorMessage = ValueNotifier<String>('');

  void dispose() {
    isLoading.dispose();
    errorMessage.dispose();
  }

  Future<void> onSubmit(String email, String password) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final token = await _authRepository.login(email, password);
      await _localStorage.setToken(token);
      isLoading.value = false;
      Modular.to.navigate(AppRoutes.customersList);
    } catch (e) {
      isLoading.value = false;
      if (e is DioException) {
        final data = e.response?.data;
        if (data != null && data is Map) {
          final message = data['message'];
          if (message is String) {
            errorMessage.value = message;
            return;
          } else if (message is List && message.isNotEmpty) {
            errorMessage.value = message[0];
            return;
          }
        }
      }
      errorMessage.value = e.toString();
    }
  }
}
