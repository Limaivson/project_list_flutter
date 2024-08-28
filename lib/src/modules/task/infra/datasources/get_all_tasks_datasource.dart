import 'dart:typed_data';

abstract class IGetAllTasksDatasource {
  Future<List<Uint8List>> getAllTasks(String userId);
}
