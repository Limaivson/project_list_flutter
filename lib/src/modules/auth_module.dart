import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_list_fliutter/src/modules/auth/presenter/pages/auth.dart';

class AuthModule extends Module {

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const AuthPage());
    r.child('/auth_page/',
        child: (context) => const AuthPage());
  }
}