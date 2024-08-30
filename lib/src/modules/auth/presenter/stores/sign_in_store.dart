import 'package:mobx/mobx.dart';
import 'package:project_list_fliutter/src/modules/auth/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/domain/usecases/login_use_case.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/comm_packages/proto/user.pb.dart';

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

  @observable
  User? loggedUser;

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
  Future<void> doLogin() async {
    if (username.isEmpty || password.isEmpty) {
      errorMessage = 'Please fill in all fields correctly';
    }

    isLoading = true;
    errorMessage = '';

    try {
      final user = await loginUseCase.execute(username, password);

      if (user != null) {
        loggedUser = user;
        print('Login successful: ${loggedUser?.name}');
        isLogged = true;
        errorMessage = '';
      } else {
        errorMessage = 'User not found';
        print(errorMessage);
      }
    } catch (e) {
      errorMessage = 'Usuário não existe';
      print('Login error: $errorMessage');
    } finally {
      isLoading = false;
    }
  }
}
