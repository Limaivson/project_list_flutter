import 'package:project_list_fliutter/src/modules/auth/domain/repositories/is_logout_repository.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/datasources/auth_datasource.dart';

// quero saber se deslogou ou quero a funcao de deslogar ??

class LogOutRepositoryImpl implements ILogOutRepository {
  final IAuthDatasource datasource;

  LogOutRepositoryImpl(this.datasource);

  @override
  Future<bool> isLogout() async {
    try {
      await datasource.logout();
      return true;
    } catch (e) {
      throw Error();
    }
  }

}
