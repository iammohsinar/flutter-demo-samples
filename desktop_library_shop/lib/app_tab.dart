import 'package:desktop_library_shop/ui/util/app_color.dart';
import 'package:desktop_library_shop/ui/util/ui_util.dart';
import 'package:desktop_library_shop/ui/views/book_view.dart';
import 'package:desktop_library_shop/ui/views/circulation_view.dart';
import 'package:desktop_library_shop/ui/views/report_view.dart';
import 'package:desktop_library_shop/ui/views/student_view.dart';
import 'package:desktop_library_shop/ui/views/user_view.dart';
import 'package:desktop_library_shop/ui/widgets/app_button.dart';
import 'package:desktop_library_shop/ui/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'core/models/user.dart';
import 'ui/views/home_view.dart';

class AppTab extends StatefulWidget {
  const AppTab({Key? key}) : super(key: key);

  @override
  _AppTabState createState() => _AppTabState();
}

class _AppTabState extends State<AppTab> {
  int index = 0;

  List<AppTabFlag> tabFlags = [
    AppTabFlag(imgUrl: 'assets/images/icons/home.png', flagName: 'Home'),
    AppTabFlag(imgUrl: 'assets/images/icons/book.png', flagName: 'Book Management'),
    AppTabFlag(imgUrl: 'assets/images/icons/student.png', flagName: 'Student Management'),
    AppTabFlag(imgUrl: 'assets/images/icons/vehicle.png', flagName: 'Circulation'),
    AppTabFlag(imgUrl: 'assets/images/icons/user.png', flagName: 'User Management'),
    AppTabFlag(imgUrl: 'assets/images/icons/printer.png', flagName: 'Reports'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  ...createHeaderFlags(),
                  Expanded(
                      child: Row(
                    children: [
                      Text('Logged on as'),
                      AppTextLabel(Provider.of<User>(context).role)
                    ],
                  )),
                ],
              ),
              Expanded(
                  //flex: 9,
                  child: AppTabView(
                index: index,
              )),
            ],
          ),
        ));
  }

  List<Widget> createHeaderFlags() {
    List<Widget> headerFlags = [];
    for (int i = 0; i < tabFlags.length; i++) {
      headerFlags
        ..add(InkWell(
          onTap: () {
            setState(() {
              index = i;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  tabFlags[i].imgUrl,
                  width: 30,
                  height: 30,
                ),
                const SizedBox(
                  width: 2,
                ),
                AppTextLabel(tabFlags[i].flagName)
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                border: (index == i)
                    ? Border.all(color: Colors.black, width: 3.0)
                    : Border.all(color: borderColor, width: 1.0),
                gradient: LinearGradient(
                    begin: const Alignment(0, 0.2),
                    end: Alignment.bottomCenter,
                    colors: [index == i ? activeColor : inActiveColor, adjustBrightness()])),
          ),
        ))
        ..add(
          const SizedBox(
            width: 2,
          ),
        );
    }
    return headerFlags;
  }
}

class AppTabFlag {
  final String imgUrl;
  final String flagName;
  AppTabFlag({required this.imgUrl, required this.flagName});
}

class AppTabView extends StatelessWidget {
  final int index;
  const AppTabView({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 1:
        return const AppTabBody(child: BookView());
      case 2:
        return const AppTabBody(child: StudentView());
      case 3:
        return const AppTabBody(child: CirculationView());
      case 4:
        return const AppTabBody(child: UserView());
      case 5:
        return const AppTabBody(child: ReportView());
      default:
        return const AppTabBody(child: HomeView());
    }
  }
}

class AppTabBody extends StatelessWidget {
  final Widget child;

  const AppTabBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: panelBackgroundColor, border: Border.all(color: Colors.black)),
        child: child);
  }
}
