import 'package:project_list_fliutter/src/modules/auth/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/domain/repositories/register_repository.dart'; 

class RegisterUseCase {
  final IRegisterRepository repository;

  RegisterUseCase(this.repository);

  Future<bool> execute(String username, String password) async {
    try {
      final userId = await repository.register(username, password);
      return userId;
    } on ExternalError catch (e) {
      throw CredentialsError('Failed to register: ${e.message}', e.stackTrace);
    } catch (e, stackTrace) {
      throw AuthError('Unexpected error during registration', stackTrace);
    }
  }
}
