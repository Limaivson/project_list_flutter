import 'package:project_list_fliutter/src/modules/auth/infra/comm_packages/proto/user.pb.dart';

abstract class AuthDatasource {
  Future<User> login(String username, String password);
  Future<User> register(String username, String password, String email);
  Future<void> logout();
  Future<User?> getCurrentUser();
}
