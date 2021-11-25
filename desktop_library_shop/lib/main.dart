import 'dart:io';

import 'package:desktop_library_shop/app_router.dart';
import 'package:desktop_library_shop/core/models/user.dart';
import 'package:desktop_library_shop/core/services/user_dao.dart';
import 'package:desktop_library_shop/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('App title');
    //Size s = await getWindowMaxSize();

    setWindowMinSize(const Size(1000, 1000));
    setWindowMaxSize(Size.infinite);
  }
  setup();
  runApp(LibraryShopApp());
}

class LibraryShopApp extends StatelessWidget {
  const LibraryShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      create: (context) => loc<UserDao>().userController.stream,
      initialData: User.initial(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Library Shop',
        theme: ThemeData(
            backgroundColor: const Color(0xFFF7F5ee),
            textTheme: const TextTheme(headline4: TextStyle(color: Colors.black))),
        initialRoute: 'login',
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
