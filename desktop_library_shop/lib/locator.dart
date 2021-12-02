import 'package:desktop_library_shop/core/config/db_connection.dart';
import 'package:desktop_library_shop/core/repositories/category_repository.dart';
import 'package:desktop_library_shop/core/repositories/student_repository.dart';
import 'package:desktop_library_shop/core/repositories/user_repository.dart';
import 'package:desktop_library_shop/core/services/book_dao.dart';
import 'package:desktop_library_shop/core/services/student_dao.dart';
import 'package:desktop_library_shop/core/services/user_dao.dart';
import 'package:desktop_library_shop/core/viewmodels/auth_bo.dart';
import 'package:desktop_library_shop/core/viewmodels/book_bo.dart';
import 'package:desktop_library_shop/core/viewmodels/home_bo.dart';
import 'package:get_it/get_it.dart';

import 'core/repositories/book_repository.dart';
import 'core/services/auth_service.dart';
import 'core/services/category_dao.dart';

GetIt loc = GetIt.instance;

void setup() {
  loc.registerLazySingleton(() => UserRepository());
  loc.registerLazySingleton(() => StudentRepository());
  loc.registerLazySingleton(() => BookRepository());
  loc.registerLazySingleton(() => CategoryRepository());

  loc.registerLazySingleton<UserDao>(() => UserDaoImpl());
  loc.registerLazySingleton<StudentDao>(() => StudentDaoImpl());
  loc.registerLazySingleton<BookDao>(() => BookDaoImpl());
  loc.registerLazySingleton<CategoryDao>(() => CategoryDaoImpl());
  //
  loc.registerLazySingleton<HomeBo>(() => HomeBoImpl());

  loc.registerFactory<AuthBo>(() => AuthBoImpl());
  loc.registerFactory<BookBo>(() => BookBoImpl());
  //loc.registerLazySingleton(() => AuthService());
}
