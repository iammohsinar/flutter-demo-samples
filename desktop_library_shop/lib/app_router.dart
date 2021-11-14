import 'package:desktop_library_shop/ui/views/book_view.dart';
import 'package:desktop_library_shop/app_tab.dart';
import 'package:desktop_library_shop/ui/views/login_view.dart';
import 'package:desktop_library_shop/ui/views/student_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => AppTab());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
      // case 'student':
      //   return MaterialPageRoute(builder: (_) => StudentView());
      // case 'book':
      //   return MaterialPageRoute(builder: (_) => BookView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('Page Not Found ${settings.name}'),
                  ),
                ));
    }
  }
}
