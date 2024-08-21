import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:window_manager/window_manager.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with WindowListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Form(
          child: Column(
            children: [
              Text('Welcome'),
              Text('Enter your credentials'),
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                    hintText: 'Enter your password',
                    ),
                  ),
                  TextButton(onPressed: null, child: Text('Login')),
                  ],
                  ),
                  InkWell(child: Text('Forget password?')),
                  Row(
                    children: [
                      Text('Already have an account?'),
                      InkWell(child: Text('Login')),
                  ],
              )
            ],
          )
        ),
      ),
    );
  }

}