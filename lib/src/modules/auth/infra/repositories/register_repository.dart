import 'package:project_list_fliutter/src/modules/auth/domain/repositories/register_repository.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/datasources/register_datasource.dart';

class RegisterRepositoryImpl implements IRegisterRepository {
  final IRegisterDatasource datasource;

  RegisterRepositoryImpl(this.datasource);


  @override
  Future<bool> register(String username, String password) async {
    try {
      final userProto = await datasource.register(username, password);
      return userProto;
    } catch (e) {
      throw Error();
    }
  }
}