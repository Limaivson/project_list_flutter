import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:project_list_fliutter/src/modules/task/presenter/pages/components/list_view.dart';

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
      body: Form(
        child:
        Column(
          children: [
            TextField(),
            ElevatedButton(onPressed: null, child: Text('ADD')),
            List()
          ],
        ),
        
      )
    );

}

}