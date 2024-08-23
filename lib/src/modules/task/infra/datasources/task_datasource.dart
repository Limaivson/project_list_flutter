import 'dart:typed_data';

abstract class TaskDatasource {
  Future<List<Uint8List>> getAllTasks();
  Future<void> saveTask(Uint8List task);
  Future<void> deleteTask(String taskId);
}
