import 'package:project_list_fliutter/src/modules/auth/domain/repositories/is_logout_repository.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/datasources/logout_datasource.dart';


class LogOutRepositoryImpl implements ILogOutRepository {
  final ILogOutDatasource datasource;

  LogOutRepositoryImpl(this.datasource);
  // Aqui a função retorna um booleano para indicar se o logout foi bem sucedido ou não, 
  // mas em outra camada que eu já não lembro mais tu não retornava nada
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
