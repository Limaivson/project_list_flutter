import 'package:project_list_fliutter/src/modules/task/domain/repositories/post_task_repository.dart';
import 'package:project_list_fliutter/src/modules/task/infra/adapters/task_adapter.dart';
import 'package:project_list_fliutter/src/modules/task/infra/datasources/save_task_datasource.dart';
import 'package:project_list_fliutter/src/modules/task/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/task/infra/comm_packages/proto/pb/tasks.pb.dart';

class PostTaskRepositoryImpl implements IPostTaskRepository {
  final ISaveTaskDatasource datasource;

  PostTaskRepositoryImpl(this.datasource);

  @override
  Future<bool?> addTask(String task) async {
    try {
      // Cria um objeto Task a partir da String recebida
      final taskProto = Task()
        ..id = '' // Gere ou receba o ID necessário
        ..task = task
        ..userId = ''; // Configure o userId adequadamente

      // Converte para Uint8List utilizando o Adapter
      final taskData = TaskAdapter.encodeProto(taskProto);

      // Salva a task através do datasource
      await datasource.saveTask(taskData);
    } catch (e) {
      throw CreateTaskError('Failed to save task', StackTrace.current);
    }
    return null;
  }
}
