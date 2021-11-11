import 'package:desktop_library_shop/core/enums/state_enums.dart';
import 'package:desktop_library_shop/core/viewmodels/auth_bo.dart';
import 'package:desktop_library_shop/ui/util/ui_util.dart';
import 'package:desktop_library_shop/ui/views/base_view.dart';
import 'package:desktop_library_shop/ui/widget/app_button.dart';
import 'package:desktop_library_shop/ui/widget/app_text.dart';
import 'package:desktop_library_shop/ui/widget/app_textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late FocusNode _userNameFocus;
  late FocusNode _passwordFocus;
  late FocusNode _loginFocus;
  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
    return BaseView<AuthBo>(
        builder: (context, model, child) => Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: Form(
              key: _formKey,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height / 4,
                    left: MediaQuery.of(context).size.width / 6,
                    right: MediaQuery.of(context).size.width / 6,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0), color: Colors.blue),
                      child: FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/login_background_left.png',
                              height: 350,
                            ),
                            Image.asset(
                              'assets/images/login_background_right.png',
                              height: 350,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 5,
                    left: MediaQuery.of(context).size.width / 2.6,
                    right: MediaQuery.of(context).size.width / 2.6,
                    bottom: MediaQuery.of(context).size.height / 2.7,
                    child: Container(
                      padding: const EdgeInsets.only(top: 50.0, left: 35.0, right: 35.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff999999), width: 0.8),
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color(0xEfFFFFFF),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 80,
                            color: const Color(0xA0999999),
                            child: Image.asset(
                              'assets/images/code_seekhlo_logo.png',
                            ),
                          ),
                          UIUtil.vSmallSpace(),
                          const Text(
                            'Library Management System',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          UIUtil.vMediumSpace(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Expanded(child: AppTextLabel('User Name')),
                              UIUtil.hSmallSpace(),
                              Expanded(
                                flex: 2,
                                child: AppTextFormField(
                                    controller: _controllerUserName,
                                    validationMsg: 'Please type your user name',
                                    icon: Icons.person,
                                    width: 150.0,
                                    height: 30.0,
                                    current: _userNameFocus,
                                    next: _passwordFocus),
                              ),
                            ],
                          ),
                          UIUtil.vSmallSpace(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(child: AppTextLabel('Password')),

                              //     Text(
                              //   'Password',
                              //   style: TextStyle(fontWeight: FontWeight.bold),
                              // )),
                              UIUtil.hSmallSpace(),
                              Expanded(
                                flex: 2,
                                child: AppTextFormField(
                                    controller: _controllerPassword,
                                    validationMsg: 'Please Enter your password',
                                    icon: Icons.vpn_key,
                                    width: 150.0,
                                    height: 30.0,
                                    current: _passwordFocus,
                                    next: _loginFocus),
                              ),
                            ],
                          ),
                          UIUtil.vSmallSpace(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppElevatedBtn(
                                  imgUrl: 'assets/images/lock.png',
                                  focusNode: _loginFocus,
                                  isEnable: true,
                                  onPressedFn: () {
                                    if (_formKey.currentState!.validate()) {
                                      // bool success = await model.login(
                                      //     _controllerUserName.text, _controllerPassword.text);
                                      // if (success) {
                                      //   Navigator.pushNamed(context, '/');
                                      // }
                                    }
                                  },
                                  text: 'Login')
                            ],
                          ),
                          UIUtil.vSmallSpace(),
                          // Row(children: [Expanded(child:
                          // A],)
                        ],
                      ),
                    ),
                  ),
                  // ),
                ],
              ),
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
