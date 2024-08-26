import 'package:http/http.dart' as http;
import 'package:project_list_fliutter/src/modules/auth/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/comm_packages/proto/user.pb.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/adapters/auth_adapter.dart';
import 'package:project_list_fliutter/src/modules/auth/external/datasources/server_routes.dart';

class AuthDatasourceExternal implements AuthDatasource {
  final http.Client client;

  AuthDatasourceExternal(this.client);

  @override
  Future<User> login(String username, String password) async {
    try {
      final uri = Uri.parse(loginRoute);
      final response = await client.post(
        uri,
        body: AuthAdapter.encodeProto(User()
          ..name = username
          ..password = password),
      );

      if (response.statusCode == 200) {
        final userProto = response.bodyBytes;
        return AuthAdapter.decodeProto(userProto);
      } else {
        throw const ExternalError(
            'Falha ao fazer login. Verifique suas credenciais.');
      }
    } catch (e) {
      throw const ExternalError('Não foi possível realizar o login.');
    }
  }

  @override
  Future<User> register(String username, String password) async {
    try {
      final uri = Uri.parse(signOUUserRoute);
      final response = await client.post(
        uri,
        body: AuthAdapter.encodeProto(User()
          ..name = username
          ..password = password),
        headers: {
          'Content-Type': 'application/x-protobuf',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.bodyBytes.length} bytes');

      if (response.statusCode == 200) {
        final userProto = response.bodyBytes;
        return AuthAdapter.decodeProto(userProto);
      } else {
        throw const ExternalError('Failed to register. Check your data.');
      }
    } catch (e) {
      throw const ExternalError('Failed to perform registration.');
    }
  }

  @override
  Future<void> logout() async {
    try {
      final uri = Uri.parse(signOUUserRoute);
      final response = await client.post(uri);

      if (response.statusCode != 200) {
        throw const ExternalError('Falha ao sair. Tente novamente.');
      }
    } catch (e) {
      throw const ExternalError('Não foi possível realizar logout.');
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      final uri = Uri.parse(signOUUserRoute);
      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final userProto = response.bodyBytes;
        return AuthAdapter.decodeProto(userProto);
      } else if (response.statusCode == 204) {
        return null;
      } else {
        throw const ExternalError('Falha ao obter o usuário atual.');
      }
    } catch (e) {
      throw const ExternalError('Não foi possível obter o usuário atual.');
    }
  }
}
