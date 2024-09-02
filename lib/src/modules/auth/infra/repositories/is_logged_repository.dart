// import 'package:project_list_fliutter/src/modules/auth/domain/repositories/is_logged_repository.dart';
// import 'package:project_list_fliutter/src/modules/auth/infra/adapters/auth_adapter.dart';
// import 'package:project_list_fliutter/src/modules/auth/infra/datasources/get_user_datasource.dart';

// class IsLoggedRepositoryImpl implements IsLoggedRepository {
//   final IGetUserDatasource datasource;

//   IsLoggedRepositoryImpl(this.datasource);


//   @override
//   Future<bool> isLoggedIn() async {
//     try {
//       final userProto = await datasource.getCurrentUser();

//       if (userProto == null) {
//         return false;
//       }

//       final userModel = AuthAdapter.decodeProto(userProto.writeToBuffer());

//       return userModel.;
//     } catch (e) {
//       throw Error();
//     }
//   }
// }

// Funcional de mais esse arquivo comentado kkkkkkkkkkkkk, não é critica só to zuando msm