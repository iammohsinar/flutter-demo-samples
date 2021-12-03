import 'package:desktop_library_shop/core/enums/state_enums.dart';
import 'package:desktop_library_shop/core/services/user_dao.dart';
import 'package:desktop_library_shop/core/viewmodels/base_bo.dart';

import '../../locator.dart';

abstract class AuthBo extends BaseBoImpl {
  late String errorMessage;
  Future<bool> login(String userName, String password);
  Future<void> logout();
}

class AuthBoImpl extends AuthBo {
  final UserDao _userDao = loc<UserDao>();

  @override
  Future<bool> login(String userName, String password) async {
    setState(StateEnum.busy);
    var uName = int.tryParse(userName.substring(0, 1));
    // should not number
    if (uName != null) {
      errorMessage = 'user name should not start with Number';
      setState(StateEnum.idle);
      return false;
    }
    var success = await _userDao.getAuthUser(userName, password);
    if (!success) {
      errorMessage = 'username or password invalid';
    }
    setState(StateEnum.idle);
    return success;
  }

  @override
  Future<void> logout() async {
    setState(StateEnum.busy);
    await _userDao.logout();
    setState(StateEnum.idle);
  }
}
