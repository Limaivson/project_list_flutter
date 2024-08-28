import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:project_list_fliutter/src/modules/task/presenter/stores/task_store.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final TaskStore taskStore = Modular.get<TaskStore>();
  final TextEditingController _controller = TextEditingController();

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
                  onSubmitted: (_) => taskStore.addTask(),
                );
              },
            ),
            const SizedBox(height: 10),
            Observer(
              builder: (_) => ElevatedButton(
                onPressed: taskStore.addTask,
                child: const Text('ADD'),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Observer(
                builder: (_) => ListView.builder(
                  itemCount: taskStore.tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(taskStore.tasks[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          taskStore.tasks.removeAt(index);
                        },
                      ),
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
