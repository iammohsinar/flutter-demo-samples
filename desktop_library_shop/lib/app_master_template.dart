import 'package:desktop_library_shop/core/viewmodels/auth_bo.dart';
import 'package:desktop_library_shop/ui/util/app_color.dart';
import 'package:desktop_library_shop/ui/util/app_responsive.dart';
import 'package:desktop_library_shop/ui/util/ui_util.dart';
import 'package:desktop_library_shop/ui/views/base_view.dart';
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
          padding: const EdgeInsets.all(5), //all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/library_logo.png',
                        height: (ScreenSize(context).smallSize) ? 35 : 70.0,
                        width: (ScreenSize(context).smallSize) ? 35 : 70.0,
                      ),
                      UIUtil.hXSmallSpace(),
                      Text(
                        //  '',

                        'LIBRARY MANAGEMENT SYSTEM',
                        style: TextStyle(
                            fontSize: (ScreenSize(context).smallSize) ? 18 : 46,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              Row(
                children: [
                  ...createHeaderFlags(),
                  Expanded(
                      child: BaseView<AuthBo>(
                    builder: (context, model, _) => Row(
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
                            onPressedFn: () {
                              model.logout();
                              Navigator.pushNamed(context, 'login');
                            },
                            text: 'Log out')
                      ],
                    ),
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
              Flexible(
                  child: AppTabBody(
                title: '',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'This software is developed by: ',
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          color: Colors.black, borderRadius: BorderRadius.circular(10.0)),
                      child: Image.asset(
                        'assets/images/code_seekhlo_logo.png',
                        width: 80,
                        height: 80,
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
