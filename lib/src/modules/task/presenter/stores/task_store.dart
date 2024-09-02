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
  List<Task> tasks = ObservableList<Task>();

  final actualTask = Task();

  @observable
  String newTask = '';

  @observable
  String errorMessage = '';

  @action
  void setNewTask(String value) {
    newTask = value;
  }

  @action
  Future<bool> addTask(String task, String userId) async {
    actualTask.task = task;
    
    if (newTask.isNotEmpty) {
      try {
        final task = await addTaskUseCase.addTask(actualTask, userId);
        tasks.add(actualTask);
        print(actualTask);
        newTask = '';
        if (task.$2 != null) {
        return true;
      }
      } catch (e) {
        print('Error adding task: $e');
      }
    }
    return false;
  }


  @action
  Future<void> loadTaskHistory(String userId) async {
    print('Loading task history for user ID: $userId');
    try {
      List<Task> taskList = await getTaskUseCase.getTasks(userId);

      print('Tasks loaded: ${taskList.map((task) => task.task).toList()}');

      tasks = ObservableList.of(taskList);
    } catch (e) {
      errorMessage = 'Failed to load tasks';
      print('Error loading task history: $e');
    }
  }
}
