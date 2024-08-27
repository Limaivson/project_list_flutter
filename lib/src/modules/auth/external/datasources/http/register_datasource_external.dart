import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_list_fliutter/src/modules/auth/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/comm_packages/proto/user.pb.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/adapters/auth_adapter.dart';
import 'package:project_list_fliutter/src/modules/auth/external/datasources/server_routes.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/datasources/register_datasource.dart';


class RegisterDatasourceExternal implements IRegisterDatasource {
    final http.Client client;

    RegisterDatasourceExternal(this.client);

    @override
    Future<bool> register(String username, String password) async {
      try {
        final uri = Uri.parse(signOUUserRoute);
        final response = await client.post(
          uri,
          body: AuthAdapter.encodeProto(User()
            ..name = username
            ..password = password),
        );

        if (response.statusCode == 200) {
          Map<String, dynamic> responseJson = json.decode(response.body);
          if (responseJson['user']) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      } catch (e) {
        throw ExternalError('Failed to perform registration: ${e.toString()}');
      }
    }

}