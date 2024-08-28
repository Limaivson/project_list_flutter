import 'package:project_list_fliutter/src/modules/task/domain/repositories/get_task_repository.dart';
import 'package:project_list_fliutter/src/modules/task/infra/adapters/task_adapter.dart';
import 'package:project_list_fliutter/src/modules/task/infra/comm_packages/proto/pb/tasks.pb.dart';
import 'package:project_list_fliutter/src/modules/task/infra/datasources/get_all_tasks_datasource.dart';
import 'package:project_list_fliutter/src/modules/task/domain/errors/error_datasource.dart';

class GetTaskRepositoryImpl implements IGetTaskRepository {
  final IGetAllTasksDatasource datasource;

  GetTaskRepositoryImpl(this.datasource);

  @override
  Future<List<Task>> getTasks(String userId) async {
    try {
      final tasksProtoList = await datasource.getAllTasks(userId);

      return tasksProtoList.map((proto) {
        final task = TaskAdapter.decodeProto(proto);
        return task;
      }).toList();
    } catch (e) {
      throw GetTaskError('Failed to fetch tasks', StackTrace.current);
    }
  }
}
