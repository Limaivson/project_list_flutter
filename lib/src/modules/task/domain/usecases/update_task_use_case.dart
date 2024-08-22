import 'package:project_list_fliutter/src/modules/task/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/task/domain/repositories/tasks_repository.dart'; 

class UpdateTaskUseCase {
  final TaskRepository repository;

  UpdateTaskUseCase(this.repository);

  Future<void> updateTask(String task) async {
    try {
      final removeTask = await repository.updateTask(task);
      return removeTask;
    } on ExternalError catch (e) {
      throw TasksError('Failed to update tasks: ${e.message}', e.stackTrace);
    } catch (e, stackTrace) {
      throw TasksError('Unexpected error', stackTrace);
    }
  }
}