import 'package:mobx/mobx.dart';
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

  // Você poder pensar em uma maneira de limpar a msg de erro
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
        isLogged = true;
        errorMessage = '';
      } else {
        errorMessage = 'User not found';
      }
    } catch (e) {
      errorMessage = 'Usuário não existe';
    } finally {
      isLoading = false;
    }
  }
}
