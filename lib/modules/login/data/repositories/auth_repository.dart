import 'package:conectar_challenge_front/modules/shared/data/models/user_model.dart';
import 'package:conectar_challenge_front/modules/shared/entities/user.dart';
import 'package:conectar_challenge_front/modules/shared/external/datasources/api_datasource.dart';

class AuthRepository {
  final ApiDatasource _apiDatasource;
  const AuthRepository(this._apiDatasource);

  Future<String> login(String email, String password) async {
    final response = await _apiDatasource.post('/auth/login', data: {'email': email, 'password': password});
    return response.data['access_token'];
  }

  Future<User> getProfile() async {
    final response = await _apiDatasource.get('/auth/profile');
    return UserModel.fromMap(response.data);
  }
}
