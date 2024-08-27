import 'package:http/http.dart' as http;
import 'package:project_list_fliutter/src/modules/auth/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/external/datasources/server_routes.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/datasources/logout_datasource.dart';


class LogOutDatasourceExternal implements ILogOutDatasource {
    final http.Client client;

    LogOutDatasourceExternal(this.client);

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

}