import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:project_list_fliutter/src/modules/task/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/task/infra/comm_packages/proto/pb/tasks.pb.dart';
import 'package:project_list_fliutter/src/modules/task/infra/datasources/task_datasource.dart';
import 'package:project_list_fliutter/src/modules/task/infra/adapters/task_adapter.dart';
import 'package:project_list_fliutter/src/modules/task/external/datasources/server_routes.dart';

class TaskDatasourceExternal implements ITaskDatasource {
  final http.Client client;

  TaskDatasourceExternal(this.client);
  
  @override
  Future<void> deleteTask(String taskId) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }
  
  @override
  Future<List<Uint8List>> getAllTasks() {
    // TODO: implement getAllTasks
    throw UnimplementedError();
  }
  
  @override
  Future<void> saveTask(Uint8List task) {
    // TODO: implement saveTask
    throw UnimplementedError();
  }

}
