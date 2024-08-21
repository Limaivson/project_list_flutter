import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
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

        child: const Form(
          child: Column(
            children: [
              Text('Welcome'),
              Text('Enter your credentials'),
              Column(
                children: [
                  TextField(
                decoration: InputDecoration(
                hintText: 'Enter your email',
                ),
              ),
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
                  Text('Dont have an account?'),
                  InkWell(child: Text('SignUp')),
                ],
              )
            ],
          )
        ),
      ),
    );
  }

}