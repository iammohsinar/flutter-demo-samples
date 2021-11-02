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
    try {
      var fetchUser = await _userRepository.getUserData(userName, password);
      var isAuthenticated = fetchUser != User.initial();
      if (isAuthenticated) {
        // add user for global stream
      }
      return isAuthenticated;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> getOne(int id) async {
    try {
      return await _userRepository.getUserById(id);
    } catch (e) {
      rethrow;
    }
  }
}

abstract class UserDao {
  Future<User> getOne(int id);
  Future<List<User>> getAll();
  Future<bool> getAuthUser(String userName, String password);
}
