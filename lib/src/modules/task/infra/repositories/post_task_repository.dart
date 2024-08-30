import 'package:project_list_fliutter/src/modules/task/domain/repositories/post_task_repository.dart';
import 'package:project_list_fliutter/src/modules/task/infra/adapters/task_adapter.dart';
import 'package:project_list_fliutter/src/modules/task/infra/datasources/save_task_datasource.dart';
import 'package:project_list_fliutter/src/modules/task/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/task/infra/comm_packages/proto/pb/tasks.pb.dart';

class PostTaskRepositoryImpl implements IPostTaskRepository {
  final ISaveTaskDatasource datasource;

  PostTaskRepositoryImpl(this.datasource);

  @override
  Future<Task> addTask(String task) async {
    try {
      final taskProto = Task()
        ..id = '' 
        ..task = task
        ..userId = ''; 

      final taskData = TaskAdapter.encodeProto(taskProto);

      await datasource.saveTask(taskData);
      return taskProto;
    } catch (e) {
      throw CreateTaskError('Failed to save task', StackTrace.current);
    }
  }
}
