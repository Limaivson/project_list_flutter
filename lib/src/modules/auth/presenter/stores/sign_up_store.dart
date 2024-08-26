import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:project_list_fliutter/src/modules/auth/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/domain/usecases/register_use_case.dart';
import 'package:project_list_fliutter/src/modules/auth/presenter/pages/sign_in.dart';

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
      errorMessage = 'invalido';
      return;
    }

    try {
      isLoading = true;
      errorMessage = '';
      final userId = await registerUseCase.execute(username, password);
      print('ok');

      //chamar o modulo de task

      // if (userId == true) {
      //   Navigator.of(context as BuildContext).pushReplacement(
      //     MaterialPageRoute(builder: (context) => SignInPage())
      //   );
      // }
      Modular.to.navigate('/tasks');
      
    } on CredentialsError catch (e) {
      errorMessage = e.message;
    } catch (e) {
      errorMessage = 'Erro';
    } finally {
      isLoading = false;
    }
  }
}
