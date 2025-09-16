import 'package:conectar_challenge_front/modules/shared/external/drivers/local_storage_driver.dart';

class LocalStorageService {
  final kTokenKey = 'token';
  final LocalStorageDriver _storageDriver = LocalStorageDriver();

  Future<String?> getToken() async {
    return _storageDriver.get(kTokenKey);
  }

  Future<void> setToken(String token) async {
    await _storageDriver.set(kTokenKey, token);
  }
}
