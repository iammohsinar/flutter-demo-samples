import 'package:desktop_library_shop/app_router.dart';
import 'package:desktop_library_shop/core/models/user.dart';
import 'package:desktop_library_shop/core/services/user_dao.dart';
import 'package:desktop_library_shop/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(LibraryShopApp());
}

class LibraryShopApp extends StatelessWidget {
  const LibraryShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      create: (context) => loc<UserDaoImpl>().userController.stream,
      initialData: User.initial(),
      child: MaterialApp(
        title: 'Library Shop',
        theme: ThemeData(),
        initialRoute: 'login',
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
