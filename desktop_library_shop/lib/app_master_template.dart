import 'package:desktop_library_shop/ui/util/app_color.dart';
import 'package:desktop_library_shop/ui/util/ui_util.dart';
import 'package:desktop_library_shop/ui/widgets/app_button.dart';
import 'package:desktop_library_shop/ui/widgets/app_tab.dart';
import 'package:desktop_library_shop/ui/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'app_router.dart';
import 'core/models/user.dart';

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
          padding: const EdgeInsets.only(
              top: 40.0, bottom: 40.0, left: 10.0, right: 10.0), //all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/library_logo.png',
                        height: 96,
                        width: 96,
                      ),
                      UIUtil.hMediumSpace(),
                      const Text(
                        '',

                        ///'LIBRARY MANAGEMENT SYSTEM',
                        style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              Row(
                children: [
                  ...createHeaderFlags(),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Logged on as'),
                      UIUtil.hXSmallSpace(),
                      AppTextLabel(Provider.of<User>(context).role.toUpperCase()),
                      UIUtil.hXSmallSpace(),
                      AppElevatedBtn(
                          width: 100.0,
                          imgUrl: 'assets/images/icons/log_out.png',
                          focusNode: FocusNode(),
                          isEnable: true,
                          onPressedFn: () {},
                          text: 'Log out')
                    ],
                  )),
                ],
              ),
              Expanded(
                  flex: 14,
                  child: AppTabRouter(
                    tapTitle:
                        "${tabFlags[index].flagName} ${(index == 0) ? '| Welcome ${Provider.of<User>(context).userName.toUpperCase()}' : ''}",
                    index: index,
                  )),
              UIUtil.vSmallSpace(),
              Expanded(
                  child: AppTabBody(
                title: '',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'This software is developed by: ',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.black, borderRadius: BorderRadius.circular(10.0)),
                      child: Image.asset(
                        'assets/images/code_seekhlo_logo.png',
                        width: 80,
                        height: 60,
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ));
  }

  List<Widget> createHeaderFlags() {
    List<Widget> headerFlags = [];
    for (int i = 0; i < tabFlags.length; i++) {
      headerFlags
        ..add(
          AppTabHeader(
            title: tabFlags[i].flagName,
            imageUrl: tabFlags[i].imgUrl,
            onTap: () {
              setState(() {
                index = i;
              });
            },
            tabIndex: i,
            tabRouterIndex: index,
          ),
        )
        ..add(
          UIUtil.hXSmallSpace(),
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
