import 'package:flutter/material.dart';
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
    return Container(
      child: const Text('Hello World'),
    );
  }
}