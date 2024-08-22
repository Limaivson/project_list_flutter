import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:window_manager/window_manager.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> with WindowListener {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        'Page Task'
      ),
    );

}

}