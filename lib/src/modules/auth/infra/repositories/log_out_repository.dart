import 'package:project_list_fliutter/src/modules/auth/domain/repositories/is_logout_repository.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/datasources/logout_datasource.dart';


class LogOutRepositoryImpl implements ILogOutRepository {
  final ILogOutDatasource datasource;

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
