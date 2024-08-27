import 'package:mobx/mobx.dart';

part 'task_store.g.dart';

class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store {
  @observable
  ObservableList<String> tasks = ObservableList<String>();

  @observable
  String newTask = '';

  @observable
  int? taskBeingEditedIndex;

  @action
  void setNewTask(String value) {
    newTask = value;
  }

  @action
  void addTask() {
    if (newTask.isNotEmpty) {
      if (taskBeingEditedIndex != null) {
        tasks[taskBeingEditedIndex!] = newTask;
        taskBeingEditedIndex = null; 
      } else {
        tasks.add(newTask);
      }
      newTask = ''; 
    }
  }

  @action
  void removeTask(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks.removeAt(index);
    }
  }

  @action
  void startEditingTask(int index) {
    if (index >= 0 && index < tasks.length) {
      taskBeingEditedIndex = index;
      newTask = tasks[index]; 
    }
  }

  @action
  void cancelEditing() {
    taskBeingEditedIndex = null;
    newTask = '';
  }

  @action
  void updateTask(String updatedTask) {
    if (taskBeingEditedIndex != null && updatedTask.isNotEmpty) {
      tasks[taskBeingEditedIndex!] = updatedTask;
      taskBeingEditedIndex = null; 
      newTask = ''; 
  }
}
}