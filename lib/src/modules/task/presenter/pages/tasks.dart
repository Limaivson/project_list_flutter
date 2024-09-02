import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:project_list_fliutter/src/modules/task/presenter/stores/task_store.dart';
import 'package:window_manager/window_manager.dart';

class TaskPage extends StatefulWidget {
  final String? userId;
  const TaskPage({super.key, this.userId});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> with WindowListener {
  late final TaskStore taskStore;
  final TextEditingController _controller = TextEditingController();
  String? userId;

  @override
  void initState() {
    super.initState();
    taskStore = context.read<TaskStore>();
    userId = Modular.args.data?['userId'] as String?;
    if (userId != null) {
      taskStore.loadTaskHistory(userId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Observer(
              builder: (_) {
                _controller.text = taskStore.newTask;
                return TextField(
                  controller: _controller,
                  onChanged: taskStore.setNewTask,
                  decoration: const InputDecoration(
                    labelText: 'Enter a task',
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Observer(
              builder: (_) => ElevatedButton(
                onPressed: () async {
                  await taskStore.addTask(taskStore.newTask, userId!);
                },
                child: const Text('ADD'),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Observer(
                builder: (_) => ListView.builder(
                  itemCount: taskStore.tasks.length,
                  itemBuilder: (context, index) {
                    final task = taskStore.tasks[index];
                    return ListTile(
                      title: Text(task.task),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
