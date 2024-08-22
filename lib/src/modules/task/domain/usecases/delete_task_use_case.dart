import 'package:project_list_fliutter/src/modules/task/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/task/domain/repositories/tasks_repository.dart'; 

class RemoveTaskUseCase {
  final TaskRepository repository;

  RemoveTaskUseCase(this.repository);

  Future<void> deleteTask(int task) async {
    try {
      final removeTask = await repository.deleteTask(task);
      return removeTask;
    } on RemoveTaskError catch (e) {
      throw TasksError('Failed to remove tasks: ${e.message}', e.stackTrace);
    } catch (e, stackTrace) {
      throw TasksError('Unexpected error', stackTrace);
    }
  }
}