import 'package:mobx/mobx.dart';
import 'package:project_list_fliutter/src/modules/auth/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/domain/usecases/register_use_case.dart';

part 'sign_up_store.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {
  final RegisterUseCase registerUseCase;

  _SignUpStore(this.registerUseCase);

  @observable
  String username = '';

  @observable
  String password = '';

  @observable
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

  @computed
  bool get isPasswordMatch => password == confirmPassword;

  @computed
  bool get isValid =>
      username.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      isPasswordMatch;

  @action
  Future<void> register() async {
    if (!isValid) {
      errorMessage = 'Please fill in all fields correctly';
      return;
    }

    try {
      isLoading = true;
      errorMessage = '';
      final userId = await registerUseCase.execute(username, password);

      print('User ID: $userId');
    } on CredentialsError catch (e) {
      errorMessage = e.message;
    } catch (e) {
      errorMessage = 'Unexpected error occurred';
    } finally {
      isLoading = false;
    }
  }
}
