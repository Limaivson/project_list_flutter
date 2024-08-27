import 'package:project_list_fliutter/src/modules/auth/domain/repositories/is_logged_repository.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/adapters/auth_adapter.dart';

class IsLoggedRepositoryImpl implements IsLoggedRepository {
  final IAuthDatasource datasource;

  IsLoggedRepositoryImpl(this.datasource);


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
