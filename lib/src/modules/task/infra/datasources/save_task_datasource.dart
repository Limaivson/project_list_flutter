import 'dart:typed_data';

abstract class ISaveTaskDatasource {
  Future<bool?> saveTask(Uint8List task);
  //Future<void> deleteTask(String taskId);
}
