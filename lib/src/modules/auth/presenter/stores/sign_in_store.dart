import 'package:mobx/mobx.dart';
import 'package:project_list_fliutter/src/modules/auth/domain/usecases/login_use_case.dart'; 

part 'sign_in_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {

  @observable
  String username = '';

  @observable
  String password = '';

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

  @computed
  bool get isValid => password.isNotEmpty && username.isNotEmpty;

}