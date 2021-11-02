// import 'package:desktop_library_shop/core/config/db_connection.dart';
// import 'package:desktop_library_shop/core/models/user.dart';
// import 'package:desktop_library_shop/core/services/user_dao.dart';
// import 'package:desktop_library_shop/locator.dart';
// import 'package:mysql1/mysql1.dart';

// main() async {
//   User u = await UserDaoImpl().getOne(1);
//   print(u.userName);
// }

// class UserDaoImpl extends UserDao {
//   //final Db _db = loc<Db>();

//   @override
//   Future<List<User>> getAll() {
//     return Future.delayed(Duration.zero);
//   }

//   @override
//   Future<User> getAuthUser(String userName, String password) async {
//     try {
//       var con = await Db.connection;
//       Results result = await con.query(
//           'select u.* from users u where userName = ? and password = ? and isActive = 1',
//           [userName, password]);
//       return result.isNotEmpty ? User.fromResult(result.first) : User.initial();
//     } catch (e) {
//       //return User.initial();
//       throw Exception('No record found $e');
//     }
//   }

//   @override
//   Future<User> getOne(int id) async {
//     try {
//       var con = await Db.connection;
//       Results result =
//           await con.query('select u.* from users u where u.userId = ? and isActive = 1', [id]);
//       return result.isNotEmpty ? User.fromResult(result.first) : User.initial();
//     } catch (e) {
//       //return User.initial();
//       throw Exception('No record found $e');
//     }
//   }
// }
