import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:project_list_fliutter/src/modules/task/external/datasources/server_routes.dart';
import 'package:project_list_fliutter/src/modules/task/infra/datasources/get_all_tasks_datasource.dart';

class GetTaskDatasourceExternal implements IGetAllTasksDatasource {
  final http.Client client;

  GetTaskDatasourceExternal(this.client);

  @override
  Future<List<Uint8List>> getAllTasks(String userId) async {
    try {
      final uri = Uri.parse(updateResponseRoute); 
      final response = await client.get(uri, headers: {'user-id': userId});

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);

        return jsonList.map((json) {
          return Uint8List.fromList(jsonEncode(json).codeUnits);
        }).toList();
      } else {
        throw Exception('Failed to load tasks');
      }
    } catch (e) {
      throw Exception('Failed to fetch tasks: ${e.toString()}');
    }
  }
}
