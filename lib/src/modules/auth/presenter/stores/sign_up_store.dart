import 'package:mobx/mobx.dart';
import 'package:project_list_fliutter/src/modules/auth/domain/usecases/register_use_case.dart';

part 'sign_up_store.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {
  final RegisterUseCase registerUseCase;

  _SignUpStore(this.registerUseCase);

  String username = '';

  String password = '';

  String confirmPassword = '';

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @action
  void setUsername(String value) {
    username = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  @observable
  bool isAuth = false;

  @computed
  bool get isPasswordMatch => password == confirmPassword;

  @computed
  bool get isValid =>
      username.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      isPasswordMatch;

  @action
  Future<bool> register(String userName, String password, String confirmPassword) async {
    if (confirmPassword == password) {
      isLoading = true;
      final (result, error) = await registerUseCase.execute(userName, password);
      isLoading = false;

      if (result == true) {
        isAuth = true;
        return true;
      } else if (error != null) {
        errorMessage = error.message;
        return false;
      }
    } else {
      return false;
    }

    return false;
  }
}
