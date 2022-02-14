//
// @ Author: Mohsin AR
// @ Email: mohsinazeemrind@gmail.com
// @ Github: https://github.com/iammohsinar
// @ Create Time: 12-11-2021 00:01:52
// @ Modified time: 10-02-2022 00:41:26
//

import 'dart:io';
import 'package:desktop_library_shop/app_router.dart';
import 'package:desktop_library_shop/core/models/user.dart';
import 'package:desktop_library_shop/core/services/user_dao.dart';
import 'package:desktop_library_shop/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void main() async {
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
