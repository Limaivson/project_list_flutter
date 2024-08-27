import 'package:project_list_fliutter/src/modules/auth/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/domain/repositories/login_repository.dart'; 

class LoginUseCase {
  final ILoginRepository repository;

  LoginUseCase(this.repository);

  Future<String> execute(String username, String password) async {
    try {
      final token = await repository.login(username, password);
      return token;
    } on ExternalError catch (e) {
      throw CredentialsError('Failed to login: ${e.message}', e.stackTrace);
    } catch (e, stackTrace) {
      throw AuthError('Unexpected error during login', stackTrace);
    }
  }
}