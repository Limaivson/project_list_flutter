import 'package:project_list_fliutter/src/modules/task/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/task/domain/repositories/post_task_repository.dart';
import 'package:project_list_fliutter/src/modules/task/infra/comm_packages/proto/pb/tasks.pb.dart';

class AddTaskUseCase {
  final IPostTaskRepository repository;

  AddTaskUseCase(this.repository);

  Future<Task> addTask(String task) async {
    try {
      final removeTask = await repository.addTask(task);
      return removeTask;
    } on CreateTaskError catch (e) {
      throw ('Failed to create tasks: ${e.message}', e.stackTrace);
    } catch (e, stackTrace) {
      throw TasksError('Unexpected error', stackTrace);
    }
  }
}