import 'package:project_list_fliutter/src/modules/auth/infra/comm_packages/proto/user.pb.dart';

abstract class ILoginDatasource {
  Future<User> login(String username, String password);
}
