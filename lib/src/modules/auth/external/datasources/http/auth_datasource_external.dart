import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:project_list_fliutter/src/modules/auth/domain/errors/error_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/comm_packages/proto/user.pb.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/adapters/auth_adapter.dart';
import 'package:project_list_fliutter/src/modules/auth/external/datasources/server_routes.dart';

class AuthDatasourceExternal implements IAuthDatasource {
  final http.Client client;

  AuthDatasourceExternal(this.client);

  @override
  Future<User> login(String username, String password) async {
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
          //verficiar se é correto a chamada aqui
          Modular.to.navigate('/sign_up');
          throw const ExternalError('Usuário não encontrado.');
        } else {
          return AuthAdapter.decodeProto(response.bodyBytes);
        }
      } else {
        throw const ExternalError(
            'Falha ao fazer login. Verifique suas credenciais.');
      }
    } catch (e) {
      throw ExternalError('Não foi possível realizar o login: ${e.toString()}');
    }
  }

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
