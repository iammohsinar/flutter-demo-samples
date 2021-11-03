import 'package:desktop_library_shop/core/enums/state_enums.dart';
import 'package:desktop_library_shop/core/services/user_dao.dart';
import 'package:desktop_library_shop/core/viewmodels/base_bo.dart';

import '../../locator.dart';

abstract class AuthBo extends BaseBoImpl {
  Future<bool> login(String userName, String password);
}

class AuthBoImpl extends AuthBo {
  final UserDao _userDao = loc<UserDao>();
  late String errorMessage;

  @override
  Future<bool> login(String userName, String password) async {
    setState(StateEnum.busy);
    var uName = int.tryParse(userName.substring(0, 0));
    // should not number
    if (uName != null) {
      errorMessage = 'user name should not start with Number';
      setState(StateEnum.idle);
      return false;
    }
    var success = await _userDao.getAuthUser(userName, password);
    setState(StateEnum.idle);
    return success;
  }
}
