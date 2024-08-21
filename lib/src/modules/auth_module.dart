import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_list_fliutter/src/modules/auth/presenter/pages/sign_in.dart';

class AuthModule extends Module {

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const SignUpPage());
    r.child('/auth_page/',
        child: (context) => const SignUpPage());
  }
}