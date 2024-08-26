import 'package:project_list_fliutter/src/modules/auth/domain/repositories/auth_repository.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/adapters/auth_adapter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

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

  @override
  Future<bool> isLogout() async {
    try {
      await datasource.logout();
      return true;
    } catch (e) {
      throw Error();
    }
  }

  @override
  Future<bool> register(String username, String password) async {
    try {
      final userProto = await datasource.register(username, password);
      return userProto;
    } catch (e) {
      throw Error();
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    try {
      final userProto = await datasource.getCurrentUser();

      if (userProto == null) {
        return false;
      }

      final userModel = AuthAdapter.decodeProto(userProto.writeToBuffer());

      return userModel.id.isNotEmpty;
    } catch (e) {
      throw Error();
    }
  }
}
