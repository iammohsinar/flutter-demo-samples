import 'package:desktop_library_shop/ui/views/book_view.dart';
import 'package:desktop_library_shop/app_master_template.dart';
import 'package:desktop_library_shop/ui/views/circulation_view.dart';
import 'package:desktop_library_shop/ui/views/home_view.dart';
import 'package:desktop_library_shop/ui/views/login_view.dart';
import 'package:desktop_library_shop/ui/views/report_view.dart';
import 'package:desktop_library_shop/ui/views/student_view.dart';
import 'package:desktop_library_shop/ui/views/user_view.dart';
import 'package:desktop_library_shop/ui/widgets/app_tab.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => AppTab());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
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

class AppTabRouter extends StatelessWidget {
  final int index;
  final String tapTitle;
  const AppTabRouter({Key? key, required this.index, required this.tapTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 1:
        return AppTabBody(title: tapTitle, child: const BookView());
      case 2:
        return AppTabBody(title: tapTitle, child: const StudentView());
      case 3:
        return AppTabBody(title: tapTitle, child: const CirculationView());
      case 4:
        return AppTabBody(title: tapTitle, child: const UserView());
      case 5:
        return AppTabBody(title: tapTitle, child: const ReportView());
      default:
        return AppTabBody(title: tapTitle, child: const HomeView());
    }
  }
}
