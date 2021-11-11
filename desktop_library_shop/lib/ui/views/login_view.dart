import 'package:desktop_library_shop/core/enums/state_enums.dart';
import 'package:desktop_library_shop/core/viewmodels/auth_bo.dart';
import 'package:desktop_library_shop/ui/views/base_view.dart';
import 'package:desktop_library_shop/widget/app_button.dart';
import 'package:desktop_library_shop/widget/app_textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late FocusNode _userNameFocus;
  late FocusNode _passwordFocus;
  late FocusNode _loginFocus;

  @override
  void initState() {
    _userNameFocus = FocusNode();
    _passwordFocus = FocusNode();
    _loginFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _userNameFocus.dispose();
    _passwordFocus.dispose();
    _loginFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthBo>(
        builder: (context, model, child) => Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.height / 4,
                  left: MediaQuery.of(context).size.width / 8,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0), color: Colors.blue),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/login_background_left.png',
                          height: 300,
                        ),
                        Image.asset(
                          'assets/images/login_background_right.png',
                          height: 300,
                        ),
                      ],
                    ),
                  ),
                ),
                // Positioned(
                //   // top: MediaQuery.of(context).size.height / 6,
                //   // left: MediaQuery.of(context).size.width / 8,
                //   // bottom: MediaQuery.of(context).size.height / 6,
                //   // right: MediaQuery.of(context).size.width / 8,
                //   child:
                Positioned(
                  top: MediaQuery.of(context).size.height / 5,
                  left: MediaQuery.of(context).size.width / 2.8,
                  child: Container(
                    //alignment: Alignment.center,
                    padding: EdgeInsets.all(50.0),
                    width: 400,
                    height: 400,
                    //clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff999999), width: 0.8),
                      borderRadius: BorderRadius.circular(20.0),
                      color: const Color(0xFFFFFFFF),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/code_seekhlo_logo.png',
                              width: 30,
                              height: 30,
                            ),
                            const Text(
                              'Library Management System',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text('User Name'),
                            AppTextFormField(
                                width: 150.0,
                                height: 30.0,
                                current: _userNameFocus,
                                next: _passwordFocus),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text('Password'),
                            AppTextFormField(
                                width: 150.0,
                                height: 30.0,
                                current: _passwordFocus,
                                next: _loginFocus),
                          ],
                        ),
                        Row(
                          children: [
                            AppElevatedBtn(
                                focusNode: _loginFocus,
                                isEnable: false,
                                onPressedFn: () {
                                  Navigator.pushNamed(context, '/');
                                },
                                text: 'Login')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                // // ),
              ],
            )

            // Container(
            //   child: Column(
            //     children: [
            //       const Text('user:Mohsin pass:123456 '),
            //       (model.state == StateEnum.busy)
            //           ? CircularProgressIndicator(
            //               value: null,
            //             )
            //           : ElevatedButton(
            //               onPressed: () async {
            //                 var success = await model.login('mohsin', '123456');
            //                 print(success);
            //                 if (success) Navigator.pushNamed(context, '/');
            //               },
            //               child: Text('login'))
            //     ],
            //   ),
            // ),
            ));
  }
}
