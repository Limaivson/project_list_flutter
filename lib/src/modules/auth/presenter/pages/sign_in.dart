import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:project_list_fliutter/src/modules/auth/presenter/pages/sign_up.dart';
import 'package:window_manager/window_manager.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with WindowListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          child: Column(
            children: [
              const Text('Welcome'),
              const Text('Enter your credentials'),
              const Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                    hintText: 'Enter your password',
                    ),
                  ),
                  TextButton(onPressed: null, child: Text('Login')),
                  ],
                  ),
                  const InkWell(child: Text('Forget password?')),
                  Row(
                    children: [
                      const Text('Already have an account?'),
                      TextButton(child: const Text('Login'), 
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AuthPage()),
                        );
                      },
                    ),
                  ],
              )
            ],
          )
        ),
      ),
    );
  }

}