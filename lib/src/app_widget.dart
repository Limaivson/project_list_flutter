import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Lista',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          background: Color(0xFFFFFFFF),
          // onBackground: Color(0xFFF8FDFF),
          // primary: Color(0xFF144232),
          // secondary: Color(0xFFBCEBDE),
          // onSecondary: Colors.black,
          // onPrimary: Colors.white,
        ),
      ),
       routerConfig: Modular.routerConfig,
    ); //added by extension
    
  }
}

