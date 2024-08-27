import 'dart:typed_data';

abstract class ISaveTaskDatasource {
  Future<void> saveTask(Uint8List task);
  //Future<void> deleteTask(String taskId);
}
