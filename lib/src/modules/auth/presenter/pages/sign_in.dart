import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:project_list_fliutter/src/modules/auth/presenter/pages/components/costumButton.dart';
import 'package:project_list_fliutter/src/modules/auth/presenter/pages/sign_up.dart';
import 'package:project_list_fliutter/src/modules/auth/presenter/stores/sign_in_store.dart';
import 'package:window_manager/window_manager.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with WindowListener {
  final formStore = FormStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 600,
          padding: const EdgeInsets.all(36),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                const Text('Enter your credentials',
                    style: TextStyle(fontSize: 17)),
                TextFormField(
                  onChanged: (value) => formStore.setUsername(value),
                  decoration: const InputDecoration(
                      hintText: 'Ex: Laura',
                      hintStyle: TextStyle(fontSize: 13),
                      label: Text('UserName'),
                      labelStyle: TextStyle(fontSize: 13)),
                ),
                TextFormField(
                  onChanged: (value) => formStore.setPassword(value),
                  decoration: const InputDecoration(
                      hintText: '****',
                      hintStyle: TextStyle(fontSize: 13),
                      label: Text('Password'),
                      labelStyle: TextStyle(fontSize: 13)),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    const SizedBox(width: 8),
                    Observer(
                      builder: (_) => formStore.isValid
                          ? InkWell(
                              onTap: () {
                                Modular.to.navigate('/sign_up/',
                                    arguments: 'Dynamic Value');
                              },
                              child: const CustomButton(isValid: true),
                            )
                          : const CustomButton(isValid: false),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
