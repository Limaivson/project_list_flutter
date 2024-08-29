import 'package:mobx/mobx.dart';
import 'package:project_list_fliutter/src/modules/auth/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/domain/usecases/login_use_case.dart';

part 'sign_in_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  final LoginUseCase loginUseCase;

  _FormStore(this.loginUseCase);

  String username = '';

  String password = '';

  @observable
  bool isLoading = false;

  @observable
  bool isLogged = false;

  @observable
  String errorMessage = '';

  @observable
  bool navigatePage = false;

  @action
  void linkToPage() {
    navigatePage = true;
  }

  @action
  void setUsername(String value) {
    username = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @computed
  bool get isValid => password.isNotEmpty && username.isNotEmpty;

  @action
  Future<void> login() async {
    if (!isValid) {
      errorMessage = 'Please fill in all fields correctly';
      return;
    }

    try {
      isLoading = true;
      errorMessage = '';
      final user = await loginUseCase.execute(username, password);
      if (user != null) {
        isLogged = true;
      } else {
        errorMessage = 'Failed to login. Please try again.';
      }
    } on CredentialsError catch (e) {
      errorMessage = e.message;
    } catch (e) {
      errorMessage = 'Unexpected error occurred';
    } finally {
      isLoading = false;
    }
  }
}
