import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:project_list_fliutter/src/modules/auth/presenter/pages/sign_in.dart';
import 'package:window_manager/window_manager.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with WindowListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          child: Column(
            children: [
              const Text('Sign up'),
              const Text('create your account'),
              const Column(
                children: [
                  TextField(
                      decoration: InputDecoration(
                        labelText: 'UserName'
                    ),
                  ),
                  TextField(
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                    ),
                  ),
                  ElevatedButton(onPressed: null, child: Text('Sign up')),
                ],
              ),
              Row(
                children: [
                  const Text('Dont have an account?'),
                  TextButton(child: const Text('SignUp'), 
                    onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignInPage()),
                      );
                  },),
                ],
              )
            ],
          )
        ),
      ),
    );
  }

}