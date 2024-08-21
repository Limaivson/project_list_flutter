import 'package:project_list_fliutter/src/modules/auth/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  Future<bool> execute() async {
    try {
      return await repository.isLogout();
    } on ExternalError catch (e) {
      throw AuthError('Failed to logout: ${e.message}', e.stackTrace);
    } catch (e, stackTrace) {
      throw AuthError('Unexpected error during logout', stackTrace);
    }
  }
}
