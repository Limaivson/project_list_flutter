import 'dart:typed_data';
import 'package:project_list_fliutter/src/modules/auth/infra/comm_packages/proto/user.pb.dart';

class AuthAdapter {

  static User decodeProto(Uint8List encodedUserProto) {
    try {
      final userProto = User.fromBuffer(encodedUserProto); 
      return User(
        id: userProto.id,
        name: userProto.name,
        password: userProto.password,
      );
    } catch (e) {
      throw Error;
    }
  }

  static Uint8List encodeProto(User userModel) {
    try {
      final userProto = User()
        ..id = userModel.id
        ..name = userModel.name
        ..password = userModel.password;
      return userProto.writeToBuffer();
    } catch (e) {
      throw Error;
    }
  }
}