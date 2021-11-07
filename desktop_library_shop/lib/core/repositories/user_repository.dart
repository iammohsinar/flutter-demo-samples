import 'package:desktop_library_shop/core/config/db_connection.dart';
import 'package:desktop_library_shop/core/models/user.dart';
import 'package:mysql1/mysql1.dart';

void main() async {
  try {
    print('object');
    var con = await Db.connection;
    Results result = await con.query(
        'select u.* from users u where userName = ? and password = ? and isActive = 1',
        ['mohsin', '123456']);
    print(result);
    //Student u = await DbConnection().getStudentById(1);
    //print(u.name);
  } catch (e) {
    print('caught $e');
  }
}

class UserRepository {
  Future<User> getUserData(String userName, String password) async {
    print('$userName $password');
    try {
      var con = await Db.connection;
      print('$con');
      Results result = await con.query(
          'select u.* from users u where userName = ? and password = ? and isActive = 1',
          [userName, password]);
      return result.isNotEmpty ? User.fromResult(result.first) : User.initial();
    } catch (e) {
      throw Exception('No record found $e');
    }
  }

  Future<User> getUserById(int id) async {
    try {
      var con = await Db.connection;
      Results result =
          await con.query('select u.* from users u where u.userId = ? and isActive = 1', [id]);
      return result.isNotEmpty ? User.fromResult(result.first) : User.initial();
    } catch (e) {
      throw Exception('No record found $e');
    }
  }
}
