import 'dart:typed_data';
import 'package:project_list_fliutter/src/modules/auth/infra/comm_packages/proto/user.pb.dart';

class AuthAdapter {
  static User decodeProto(Uint8List encodedUserProto) {
    try {
      final userProto = User.fromBuffer(encodedUserProto);
      return userProto;
    } catch (e) {
      throw Error;
    }
  }

  static Uint8List encodeProto(User userModel) {
    try {
      // final userProto = User();
      //   userProto.id = userModel.id;
      //   userProto.name = userModel.name;
      //   userProto.password = userModel.password;
      return userModel.writeToBuffer();
    } catch (e) {
      throw Error;
    }
  }
}
