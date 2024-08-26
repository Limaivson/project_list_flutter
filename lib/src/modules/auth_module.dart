import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:project_list_fliutter/src/modules/auth/domain/repositories/auth_repository.dart';
import 'package:project_list_fliutter/src/modules/auth/domain/usecases/register_use_case.dart';
import 'package:project_list_fliutter/src/modules/auth/external/datasources/http/auth_datasource_external.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/repositories/auth_repository.dart';
import 'package:project_list_fliutter/src/modules/auth/presenter/pages/sign_up.dart';
import 'package:project_list_fliutter/src/modules/auth/presenter/stores/sign_up_store.dart';

class AuthModule extends Module {
  @override
  void binds(i) {
    i.add(http.Client.new);

    i.add<AuthDatasource>(AuthDatasourceExternal.new);

    i.add<AuthRepository>(AuthRepositoryImpl.new);

    i.add<RegisterUseCase>(RegisterUseCase.new);

    i.addSingleton<SignUpStore>(SignUpStore.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => SignUpPage());
  }
}
