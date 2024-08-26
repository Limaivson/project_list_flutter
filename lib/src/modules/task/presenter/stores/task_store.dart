import 'package:mobx/mobx.dart';

part 'task_store.g.dart';

class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store {
  @observable
  ObservableList<String> tasks = ObservableList<String>();

  @observable
  String newTask = '';

  @action
  void setNewTask(String value) {
    newTask = value;
  }

  @action
  void addTask() {
    if (newTask.isNotEmpty) {
      tasks.add(newTask);
      newTask = ''; 
    }
  }
}
