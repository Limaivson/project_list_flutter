import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:project_list_fliutter/src/modules/task/presenter/stores/task_store.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final TaskStore taskStore = TaskStore();

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
            // Input field
            TextField(
              onChanged: taskStore.setNewTask,
              decoration: const InputDecoration(
                labelText: 'Enter a task',
              ),
              onSubmitted: (_) => taskStore.addTask(),
            ),
            const SizedBox(height: 10),

            // Add button
            ElevatedButton(
              onPressed: taskStore.addTask,
              child: const Text('ADD'),
            ),

            const SizedBox(height: 20),

            // List of tasks
            Expanded(
              child: Observer(
                builder: (_) => ListView.builder(
                  itemCount: taskStore.tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(taskStore.tasks[index]),
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
