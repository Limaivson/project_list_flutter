import 'package:project_list_fliutter/src/modules/task/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/task/domain/repositories/tasks_repository.dart'; 

class AddTaskUseCase {
  final TaskRepository repository;

  AddTaskUseCase(this.repository);

  Future<void> addTask(String task) async {
    try {
      final removeTask = await repository.addTask(task);
      return removeTask;
    } on ExternalError catch (e) {
      throw TasksError('Failed to create tasks: ${e.message}', e.stackTrace);
    } catch (e, stackTrace) {
      throw TasksError('Unexpected error', stackTrace);
    }
  }
}