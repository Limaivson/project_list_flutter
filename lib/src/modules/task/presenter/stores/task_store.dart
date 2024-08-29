import 'package:mobx/mobx.dart';
import 'package:project_list_fliutter/src/modules/task/domain/usecases/add_task_use_case.dart';
import 'package:project_list_fliutter/src/modules/task/domain/usecases/get_task_use_case.dart';
import 'package:project_list_fliutter/src/modules/task/infra/comm_packages/proto/pb/tasks.pb.dart';

part 'task_store.g.dart';

class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store {
  final AddTaskUseCase addTaskUseCase;
  final GetTaskUseCase getTaskUseCase;

  _TaskStore(this.addTaskUseCase, this.getTaskUseCase);

  @observable
  ObservableList<String> tasks = ObservableList<String>();

  @observable
  String newTask = '';

  @action
  void setNewTask(String value) {
    newTask = value;
  }

  String errorMessage = '';

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

  @action
  Future<void> loadTaskHistory(String userId) async {
    try {
      List<Task> tasks = await getTaskUseCase.getTasks(userId);
      tasks = ObservableList.of(tasks);
      print('cheguei');
    } catch (e) {
      errorMessage = '';
    }
  }
}
