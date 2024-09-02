import 'package:project_list_fliutter/src/modules/task/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/task/infra/comm_packages/proto/pb/tasks.pb.dart';

abstract class IPostTaskRepository {
  Future<(bool?, CreateTaskError?)> addTask(Task task, String userId);
}
