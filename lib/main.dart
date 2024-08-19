import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_list_fliutter/src/modules/task/presenter/pages/tasks.dart';
import 'package:project_list_fliutter/src/modules/tasks_module.dart';
import 'package:window_manager/window_manager.dart';

void main() {

  return runApp(ModularApp(module: TasksModule(), child: TaskPage()));
}


