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
              Text('Sign up'),
              Text('create your account'),
              Column(
                children: [
                  TextField(
                      decoration: InputDecoration(
                        hintText: 'UserName',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Confirm password',
                    ),
                  ),
                  TextButton(onPressed: null, child: Text('Sign up')),
                  Text('or'),
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