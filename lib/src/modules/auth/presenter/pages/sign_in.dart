import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:project_list_fliutter/src/modules/auth/presenter/stores/sign_in_store.dart';
import 'package:window_manager/window_manager.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with WindowListener {
  final formStore = Modular.get<FormStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: (_) {
            return Column(
              children: [
                if (formStore.errorMessage.isNotEmpty)
                  Text(
                    formStore.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Username'),
                  onChanged: formStore.setUsername,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onChanged: formStore.setPassword,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: formStore.isLoading
                      ? null
                      : () {
                          formStore.login();
                        },
                  child: formStore.isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Sign In'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
