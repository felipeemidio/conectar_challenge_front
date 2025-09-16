import 'package:conectar_challenge_front/modules/shared/data/models/user_create_dto_model.dart';
import 'package:conectar_challenge_front/modules/shared/entities/user_create_dto.dart';
import 'package:conectar_challenge_front/modules/shared/external/datasources/api_datasource.dart';

class UserRepository {
  final ApiDatasource _apiDatasource;
  const UserRepository(this._apiDatasource);

  Future<void> create(UserCreateDto user) async {
    final model = UserCreateDtoModel.fromEntity(user);
    await _apiDatasource.post('/users', data: model.toMap());
  }
}
