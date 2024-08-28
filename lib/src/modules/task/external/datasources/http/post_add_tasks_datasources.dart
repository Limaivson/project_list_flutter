import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:project_list_fliutter/src/modules/task/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/task/external/datasources/server_routes.dart';
import 'package:project_list_fliutter/src/modules/task/infra/datasources/save_task_datasource.dart';

class PostAddTasksDatasource implements ISaveTaskDatasource {
  final http.Client client;

  PostAddTasksDatasource(this.client);

  @override
  Future<void> saveTask(Uint8List taskProto) async {
    try {
      final uri = Uri.parse(addTaskRoute);
      final response = await client.post(
        uri,
        headers: {
          'Content-Type': 'application/octet-stream',
        },
        body: taskProto,
      );

      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        if (responseJson['task'] == true) {
          return;
        } else {
          throw ExternalError('Failed to add task');
        }
      } else {
        throw ExternalError(
            'Failed to add task with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw ExternalError('Failed to save task: ${e.toString()}');
    }
  }
}
