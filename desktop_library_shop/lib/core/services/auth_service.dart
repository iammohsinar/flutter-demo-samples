import 'package:desktop_library_shop/core/config/db_connection.dart';
import 'package:desktop_library_shop/core/models/user.dart';
import 'package:desktop_library_shop/locator.dart';

class AuthService {
  final DbConnection _db = loc<DbConnection>();

  Future<bool> login(String userName, String password) async {
    var fetchUser = await _db.getUserData(userName, password);
    var isAuthenticated = fetchUser != User.initial();
    if (isAuthenticated) {
      // add user for global stream
    }
    return isAuthenticated;
  }
}
