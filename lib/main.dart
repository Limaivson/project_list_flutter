import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_list_fliutter/src/app_widget.dart';
import 'package:project_list_fliutter/src/modules/auth/presenter/pages/sign_in.dart';
import 'package:project_list_fliutter/src/modules/auth_module.dart';

void main() {

  return runApp(ModularApp(module: AuthModule(), child: const AppWidget()));
}


