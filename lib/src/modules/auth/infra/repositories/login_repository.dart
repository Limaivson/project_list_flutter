import 'package:project_list_fliutter/src/modules/auth/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/comm_packages/proto/user.pb.dart';
import 'package:project_list_fliutter/src/modules/auth/domain/repositories/login_repository.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/datasources/login_datasource.dart';

class LoginRepositoryImpl implements ILoginRepository {
  final ILoginDatasource datasource;

  LoginRepositoryImpl(this.datasource);

  @override
  Future<(User?, CredentialsError?)> login(String username, String password) async {
    try {
      final (user, error) = await datasource.login(username, password);
      if (error != null) {
        return (null, error);
      }
      // Isso poderia estar no use case. Lembra que o use case é o teu 'contrato'
      if (user == null) {
        throw const CredentialsError('Invalid response from the server');
      }
      return (user, null);
    } catch (e) {
      throw CredentialsError('An unexpected error occurred: ${e.toString()}');
    }
  }
}
