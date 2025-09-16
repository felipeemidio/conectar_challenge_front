import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

abstract class AppValidators {
  static FormFieldValidator<String> multiple(List<FormFieldValidator<String>> validators) {
    return (value) {
      for (var validator in validators) {
        final error = validator(value);
        if (error != null) return error;
      }
      return null;
    };
  }

  static FormFieldValidator<String> required({String? message}) {
    return (value) {
      if (value == null || value.isEmpty) return message ?? 'Campo obrigatório';
      return null;
    };
  }

  static FormFieldValidator<String> compare(String text, {String? message}) {
    return (value) {
      if (value?.trim() != text) return message ?? 'Campos devem ser iguais';
      return null;
    };
  }

  static FormFieldValidator<String> cnpj({String? message}) {
    return (value) {
      if (value == null || value.isEmpty || !UtilBrasilFields.isCNPJValido(value)) return message ?? 'CNPJ inválido';
      return null;
    };
  }
}
