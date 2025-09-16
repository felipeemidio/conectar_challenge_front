import 'package:conectar_challenge_front/modules/shared/data/services/local_storage_service.dart';
import 'package:conectar_challenge_front/modules/shared/external/datasources/api_datasource.dart';
import 'package:conectar_challenge_front/modules/shared/external/drivers/local_storage_driver.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SharedModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add(LocalStorageDriver.new);
    i.add(ApiDatasource.new);
    i.add(LocalStorageService.new);
  }
}
