import 'package:project_list_fliutter/src/modules/task/domain/repositories/tasks_repository.dart';
import 'package:project_list_fliutter/src/modules/task/infra/adapters/task_adapter.dart';
import 'package:project_list_fliutter/src/modules/task/infra/datasources/task_datasource.dart';

abstract class TaskDatasource {
  
}

class TaskRepositoryImpl implements TaskRepository {
  final TaskDatasource datasource;

  TaskRepositoryImpl(this.datasource);
  
  @override
  Future<void> addTask(String task) {
    // TODO: implement addTask
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteTask(int taskId) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }
  
  @override
  Future<List<String>> getTasks() {
    // TODO: implement getTasks
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateTask(String task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }

  
 
}
