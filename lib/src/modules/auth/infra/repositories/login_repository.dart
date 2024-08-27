import 'package:project_list_fliutter/src/modules/auth/domain/repositories/login_repository.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/adapters/auth_adapter.dart';

class LoginRepositoryImpl implements ILoginRepository {
  final IAuthDatasource datasource;

  LoginRepositoryImpl(this.datasource);

  //retornar um User
  @override
  Future<String> login(String username, String password) async {
    try {
      final userProto = await datasource.login(username, password);

      final userModel = AuthAdapter.decodeProto(userProto.writeToBuffer());

      return userModel.id;
    } catch (e) {
      throw Error();
    }
  }

}
