import 'dart:typed_data';
import 'package:project_list_fliutter/src/modules/task/infra/comm_packages/proto/pb/tasks.pb.dart';

class TaskAdapter {

  static Task decodeProto(Uint8List encodedUserProto) {
    try {
      final taskProto = Task.fromBuffer(encodedUserProto); 
      return Task(
        id: taskProto.id,
        task: taskProto.task,
        userId: taskProto.userId,
      );
    } catch (e) {
      throw Error;
    }
  }

  static Uint8List encodeProto(Task userModel, String userId) {
    try {
      final taskProto = Task()
        ..id = userModel.id
        ..task = userModel.task
        ..userId = userId;
      return taskProto.writeToBuffer();
    } catch (e) {
      throw Error;
    }
  }
}