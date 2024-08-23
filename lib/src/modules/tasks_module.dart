import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_list_fliutter/src/modules/task/presenter/pages/tasks.dart';

class TasksModule extends Module {

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const TaskPage());
  }
}