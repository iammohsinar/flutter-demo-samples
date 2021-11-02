import 'package:desktop_library_shop/core/models/user.dart';
import 'package:desktop_library_shop/core/repositories/user_repository.dart';
import 'package:desktop_library_shop/locator.dart';

class UserDaoImpl extends UserDao {
  final UserRepository _userRepository = loc<UserRepository>();

  @override
  Future<List<User>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<bool> getAuthUser(String userName, String password) async {
    var fetchUser = await _userRepository.getUserData(userName, password);
    var isAuthenticated = fetchUser != User.initial();
    if (isAuthenticated) {
      // add user for global stream
    }
    return isAuthenticated;
  }

  @override
  Future<User> getOne(int id) {
    // TODO: implement getOne
    throw UnimplementedError();
  }
}

abstract class UserDao {
  Future<User> getOne(int id);
  Future<List<User>> getAll();
  Future<bool> getAuthUser(String userName, String password);
}
