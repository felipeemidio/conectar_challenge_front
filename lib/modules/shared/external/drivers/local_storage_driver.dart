import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageDriver {
  late final FlutterSecureStorage _storage;

  LocalStorageDriver() {
    _storage = const FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));
  }

  Future<String?> get(String key) async {
    return _storage.read(key: key);
  }

  Future<void> set(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> remove(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> clear() async {
    await _storage.deleteAll();
  }
}
