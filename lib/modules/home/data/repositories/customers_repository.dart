import 'package:conectar_challenge_front/modules/home/data/models/customer_create_dto_model.dart';
import 'package:conectar_challenge_front/modules/home/data/models/customer_model.dart';
import 'package:conectar_challenge_front/modules/home/data/models/filter_costumer_dto_model.dart';
import 'package:conectar_challenge_front/modules/home/entities/customer.dart';
import 'package:conectar_challenge_front/modules/home/entities/customer_create_dto.dart';
import 'package:conectar_challenge_front/modules/home/entities/filter_customer_dto.dart';
import 'package:conectar_challenge_front/modules/shared/external/datasources/api_datasource.dart';

class CustomersRepository {
  final ApiDatasource _apiDatasource;

  const CustomersRepository(this._apiDatasource);

  Future<List<Customer>> getCustomers({FilterCustomerDto? filters}) async {
    final filterModel = filters == null ? null : FilterCostumerDtoModel.fromEntity(filters);
    final response = await _apiDatasource.get('/customers', query: filterModel?.toMap());
    return (response.data as List).map((e) => CustomerModel.fromMap(e)).toList();
  }

  Future<void> create(CustomerCreateDto customer) async {
    final model = CustomerCreateDtoModel.fromEntity(customer);
    await _apiDatasource.post('/customers', data: model.toMap());
  }
}
