import 'package:mobx/mobx.dart';
import 'package:project_list_fliutter/src/modules/task/domain/usecases/add_task_use_case.dart';

part 'task_store.g.dart';

class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store {
  final AddTaskUseCase addTaskUseCase;

  _TaskStore(this.addTaskUseCase);

  @observable
  ObservableList<String> tasks = ObservableList<String>();

  @observable
  String newTask = '';

  @action
  void setNewTask(String value) {
    newTask = value;
  }

  @action
  Future<void> addTask() async {
    if (newTask.isNotEmpty) {
      try {
        await addTaskUseCase.addTask(newTask);
        tasks.add(newTask);
        newTask = '';
      } catch (e) {
        print('Error adding task: $e');
      }
    }
  }
}
