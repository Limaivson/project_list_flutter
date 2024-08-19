import 'package:project_list_fliutter/src/modules/auth/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/domain/repositories/auth_repository.dart'; 

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<String> execute(String username, String password) async {
    try {
      return await authRepository.login(username, password);
    } on AuthError catch (e) {
      throw e;
    }
  }
}
