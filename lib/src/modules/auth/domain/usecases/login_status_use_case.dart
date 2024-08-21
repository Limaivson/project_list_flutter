import 'package:project_list_fliutter/src/modules/auth/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/domain/repositories/auth_repository.dart'; 


class CheckLoginStatusUseCase {
  final AuthRepository repository;

  CheckLoginStatusUseCase(this.repository);

  Future<bool> execute() async {
    try {
      return await repository.isLoggedIn();
    } on ExternalError catch (e) {
      throw AuthError('Failed to check login status: ${e.message}', e.stackTrace);
    } catch (e, stackTrace) {
      throw AuthError('Unexpected error during login status check', stackTrace);
    }
  }
}
