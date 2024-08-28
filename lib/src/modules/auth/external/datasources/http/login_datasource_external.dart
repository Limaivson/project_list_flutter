import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:project_list_fliutter/src/modules/auth/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/comm_packages/proto/user.pb.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/adapters/auth_adapter.dart';
import 'package:project_list_fliutter/src/modules/auth/external/datasources/server_routes.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/datasources/login_datasource.dart';


class LoginDatasourceExternal implements ILoginDatasource {
    final http.Client client;

    LoginDatasourceExternal(this.client);

    @override
    Future<(User?, CredentialsError?)> login(String username, String password) async {
      try {
        final userProto = User()
          ..name = username
          ..password = password;

        final uri = Uri.parse(loginRoute);

        final response = await client.post(
          uri,
          body: AuthAdapter.encodeProto(userProto),
        );
        final responseBodyString = String.fromCharCodes(response.bodyBytes);
        print(responseBodyString);

        if (response.statusCode == 200) {
          final responseBodyString = String.fromCharCodes(response.bodyBytes);

          if (responseBodyString == 'User not found') {
            throw const ExternalError('Usuário não encontrado.');
          } else {
            return (AuthAdapter.decodeProto(response.bodyBytes), null);
          }
        } else {
          throw const ExternalError(
              'Falha ao fazer login. Verifique suas credenciais.');
        }
      } catch (e) {
        throw ExternalError('Não foi possível realizar o login: ${e.toString()}');
      }
    }

}