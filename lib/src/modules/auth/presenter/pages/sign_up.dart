import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:project_list_fliutter/src/modules/auth/presenter/stores/sign_up_store.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final signUpStore = Modular.get<SignUpStore>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: (_) {
            return Column(
              children: [
                if (signUpStore.errorMessage.isNotEmpty)
                  Text(
                    signUpStore.errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                TextField(
                  decoration: InputDecoration(labelText: 'Username'),
                  onChanged: signUpStore.setUsername,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onChanged: signUpStore.setPassword,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                  onChanged: signUpStore.setConfirmPassword,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: signUpStore.isLoading
                      ? null
                      : () {
                          signUpStore.register();
                        },
                  child: signUpStore.isLoading
                      ? CircularProgressIndicator()
                      : Text('Sign Up'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
