import 'package:conectar_challenge_front/core/consts/app_routes.dart';
import 'package:conectar_challenge_front/modules/shared/data/repositories/user_repository.dart';
import 'package:conectar_challenge_front/modules/shared/entities/user_create_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterPageController {
  final _userRepository = Modular.get<UserRepository>();

  final isAdmin = ValueNotifier<bool>(false);
  final errorMessage = ValueNotifier<String>('');
  final isLoading = ValueNotifier<bool>(false);

  void dispose() {
    isAdmin.dispose();
    errorMessage.dispose();
    isLoading.dispose();
  }

  onSubmit(UserCreateDto user) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      await _userRepository.create(user);
      isLoading.value = false;
      Modular.to.navigate(AppRoutes.login);
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
