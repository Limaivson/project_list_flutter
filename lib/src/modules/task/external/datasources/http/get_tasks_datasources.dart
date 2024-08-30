import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:project_list_fliutter/src/modules/task/external/datasources/server_routes.dart';
import 'package:project_list_fliutter/src/modules/task/infra/comm_packages/proto/pb/tasks.pb.dart';
import 'package:project_list_fliutter/src/modules/task/infra/datasources/get_all_tasks_datasource.dart';

class GetTaskDatasourceExternal implements IGetAllTasksDatasource {
  final http.Client client;

  GetTaskDatasourceExternal(this.client);

  @override
  Future<List<Task>> getAllTasks(String userId) async {
    try {
      final uri = Uri.parse(updateResponseRoute);

      final response = await client.get(
        uri,
        headers: {'id': userId},
      );
      print('Response status: ${response.statusCode}');
      print('Response headers: ${response.headers}');
      print('Response body: ${response.body}');


      if (response.statusCode == 200) {
        final Uint8List responseBodyBytes = response.bodyBytes;
        final tasksProto = Tasks.fromBuffer(responseBodyBytes);
        return tasksProto.tasks
            .map((task) => Task(
                  id: task.id,
                  task: task.task,
                  userId: task.userId,
                ))
            .toList();
      } else {
        throw Exception('Failed to load tasks');
      }
    } catch (e) {
      throw Exception('Failed to fetch tasks: ${e.toString()}');
    }
  }
}
