import 'package:conectar_challenge_front/main_module.dart';
import 'package:conectar_challenge_front/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  runApp(ModularApp(module: MainModule(), child: const MainWidget()));
}
