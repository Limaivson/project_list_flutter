import 'package:project_list_fliutter/src/modules/auth/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/domain/repositories/register_repository.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/datasources/register_datasource.dart';

class RegisterRepositoryImpl implements IRegisterRepository {
  final IRegisterDatasource datasource;

  RegisterRepositoryImpl(this.datasource);

  @override
  Future<(bool?, CredentialsError?)> register(String username, String password) async {
    try {
      final userProto = await datasource.register(username, password);
      if (userProto != null) {
        return (true, null);  // suuucesso, retorna true e nenhum erro
      } else {
        return (false, CredentialsError('Registration failed'));  // falhei, retorna false e um erro
      }
    } catch (e) {
      return (false, CredentialsError('An unexpected error occurred during registration: ${e.toString()}'));
    }
  }
}
