import 'package:project_list_fliutter/src/modules/auth/infra/comm_packages/proto/user.pb.dart';

abstract class IAuthDatasource {
  Future<User> login(String username, String password);
  Future<bool> register(String username, String password);
  Future<void> logout();
  Future<User?> getCurrentUser();
}
