// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on _TaskStore, Store {
  late final _$tasksAtom = Atom(name: '_TaskStore.tasks', context: context);

  @override
  ObservableList<String> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<String> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$newTaskAtom = Atom(name: '_TaskStore.newTask', context: context);

  @override
  String get newTask {
    _$newTaskAtom.reportRead();
    return super.newTask;
  }

  @override
  set newTask(String value) {
    _$newTaskAtom.reportWrite(value, super.newTask, () {
      super.newTask = value;
    });
  }

  late final _$_TaskStoreActionController =
      ActionController(name: '_TaskStore', context: context);

  @override
  void setNewTask(String value) {
    final _$actionInfo =
        _$_TaskStoreActionController.startAction(name: '_TaskStore.setNewTask');
    try {
      return super.setNewTask(value);
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTask() {
    final _$actionInfo =
        _$_TaskStoreActionController.startAction(name: '_TaskStore.addTask');
    try {
      return super.addTask();
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks},
newTask: ${newTask}
    ''';
  }
}
