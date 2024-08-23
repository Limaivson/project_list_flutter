import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
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
  void initState(){
    autorun((_) {

    });

    reaction((_) => formStore.isValid, (_) {

    }
    );

    when((_) => formStore.isValid, (){

    });

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          child: Column(
            children: [
              const Text('Welcome'),
              const Text('Enter your credentials'),
              Column(
                children: [
                  TextFormField(
                    onChanged: (value) => formStore.setUsername(value),
                    decoration: const InputDecoration(
                      hintText: 'UserName',
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) => formStore.setPassword(value),
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                  ],
                  ),
                  const InkWell(child: Text('Forget password?')),
                  Row(
                    children: [
                      const Text('Already have an account?'),
                      Observer(
                        builder: (_) => formStore.isValid ? InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                          },
                          child: CustomButton(isValid: true),
                        )
                        : const CustomButton(isValid: false)
                      )
                  ],
              )
            ],
          )
        ),
      ),
    );
  }

}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.isValid,
  });

  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 50,
      width: 80,
      decoration: BoxDecoration(
        color: isValid ? Colors.deepPurple : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text(
          'Entrar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}