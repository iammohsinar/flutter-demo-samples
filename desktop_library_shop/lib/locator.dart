import 'package:desktop_library_shop/core/config/db_connection.dart';
import 'package:desktop_library_shop/core/repositories/user_repository.dart';
import 'package:desktop_library_shop/core/services/user_dao.dart';
import 'package:get_it/get_it.dart';

import 'core/services/auth_service.dart';

GetIt loc = GetIt.instance;

void setup() {
  loc.registerLazySingleton(() => DbConnection());
  // loc.registerLazySingleton(() => Db());
  loc.registerLazySingleton(() => UserRepository());
  loc.registerLazySingleton(() => UserDaoImpl());
  //loc.registerLazySingleton(() => AuthService());
}
