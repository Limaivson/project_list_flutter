import 'package:project_list_fliutter/src/modules/task/domain/repositories/post_task_repository.dart';
import 'package:project_list_fliutter/src/modules/task/infra/adapters/task_adapter.dart';
import 'package:project_list_fliutter/src/modules/task/infra/datasources/save_task_datasource.dart';
import 'package:project_list_fliutter/src/modules/task/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/task/infra/comm_packages/proto/pb/tasks.pb.dart';

class PostTaskRepositoryImpl implements IPostTaskRepository {
  final ISaveTaskDatasource datasource;

  PostTaskRepositoryImpl(this.datasource);

  @override
  Future<(bool?, CreateTaskError?)> addTask(Task task, String userId) async {
    try {
      final taskEnconde = TaskAdapter.encodeProto(task, userId);
      final res = await datasource.saveTask(taskEnconde);
      if (res != null) {
        return (true, null);
      } else {
        return (null, const CreateTaskError('Error'));
      } 
    } catch (e) {
      throw Exception('Faildes to add tasks: ${e.toString()}');
    }
  }
}