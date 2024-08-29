import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:project_list_fliutter/src/modules/task/domain/repositories/get_task_repository.dart';
import 'package:project_list_fliutter/src/modules/task/domain/repositories/post_task_repository.dart';
import 'package:project_list_fliutter/src/modules/task/domain/usecases/add_task_use_case.dart';
import 'package:project_list_fliutter/src/modules/task/domain/usecases/get_task_use_case.dart';
import 'package:project_list_fliutter/src/modules/task/external/datasources/http/get_tasks_datasources.dart';
import 'package:project_list_fliutter/src/modules/task/external/datasources/http/post_add_tasks_datasources.dart';
import 'package:project_list_fliutter/src/modules/task/infra/datasources/get_all_tasks_datasource.dart';
import 'package:project_list_fliutter/src/modules/task/infra/datasources/save_task_datasource.dart';
import 'package:project_list_fliutter/src/modules/task/infra/repositories/get_task_repository.dart';
import 'package:project_list_fliutter/src/modules/task/infra/repositories/post_task_repository.dart';
import 'package:project_list_fliutter/src/modules/task/presenter/pages/tasks.dart';
import 'package:project_list_fliutter/src/modules/task/presenter/stores/task_store.dart';

class TaskModule extends Module {
  @override
  void binds(i) {
    i.add(http.Client.new);

    //datsources
    i.add<ISaveTaskDatasource>(PostAddTasksDatasource.new);
    i.add<IGetAllTasksDatasource>(GetTaskDatasourceExternal.new);

    //stores

    i.addSingleton<TaskStore>(TaskStore.new);

    //use-cases

    i.add<GetTaskUseCase>(GetTaskUseCase.new);
    i.add<AddTaskUseCase>(AddTaskUseCase.new);

    //repository

    i.add<IPostTaskRepository>(PostTaskRepositoryImpl.new);
    i.add<IGetTaskRepository>(GetTaskRepositoryImpl.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const TaskPage());
  }
}
