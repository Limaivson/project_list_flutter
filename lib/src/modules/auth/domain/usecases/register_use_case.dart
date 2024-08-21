import 'package:project_list_fliutter/src/modules/auth/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/domain/repositories/auth_repository.dart'; 

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<String> execute(String username, String password, String email) async {
    try {
      final userId = await repository.register(username, password, email);
      return userId;
    } on ExternalError catch (e) {
      throw CredentialsError('Failed to register: ${e.message}', e.stackTrace);
    } catch (e, stackTrace) {
      throw AuthError('Unexpected error during registration', stackTrace);
    }
  }
}