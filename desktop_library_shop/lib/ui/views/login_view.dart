import 'package:desktop_library_shop/core/enums/state_enums.dart';
import 'package:desktop_library_shop/core/viewmodels/auth_bo.dart';
import 'package:desktop_library_shop/ui/util/app_color.dart';
import 'package:desktop_library_shop/ui/util/ui_util.dart';
import 'package:desktop_library_shop/ui/views/base_view.dart';
import 'package:desktop_library_shop/ui/widgets/app_button.dart';
import 'package:desktop_library_shop/ui/widgets/app_text.dart';
import 'package:desktop_library_shop/ui/widgets/app_textformfield.dart';
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
  String _errorMessage = '';

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
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          const LoginBackground(),
          Positioned(
              top: MediaQuery.of(context).size.height / 5.5,
              left: MediaQuery.of(context).size.width / 2.8,
              right: MediaQuery.of(context).size.width / 2.8,
              bottom: MediaQuery.of(context).size.height / 3,
              child: Container(
                  padding: const EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: borderColor, width: 0.8),
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xEfFFFFFF),
                  ),
                  child: BaseView<AuthBo>(
                    builder: (context, model, _) => Form(
                      key: _formKey,
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                    height: 55.0,
                                    current: _userNameFocus,
                                    next: _passwordFocus),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(child: AppTextLabel('Password')),
                              UIUtil.hSmallSpace(),
                              Expanded(
                                flex: 2,
                                child: AppTextFormField(
                                    obscureText: true,
                                    controller: _controllerPassword,
                                    validationMsg: 'Please Enter your password',
                                    icon: Icons.vpn_key,
                                    width: 150.0,
                                    height: 55.0,
                                    current: _passwordFocus,
                                    next: _loginFocus),
                              ),
                            ],
                          ),
                          AppErrorText(_errorMessage),
                          (model.state == StateEnum.busy)
                              ? const CircularProgressIndicator()
                              : Container(
                                  alignment: Alignment.centerLeft,
                                  child: AppElevatedBtn(
                                      width: 80.0,
                                      imgUrl: 'assets/images/lock.png',
                                      focusNode: _loginFocus,
                                      isEnable: true,
                                      onPressedFn: () async {
                                        if (_formKey.currentState!.validate()) {
                                          bool successLogin = await model.login(
                                              _controllerUserName.text,
                                              _controllerPassword.text);
                                          if (successLogin) {
                                            Navigator.pushNamed(context, '/');
                                          } else {
                                            _errorMessage = model.errorMessage;
                                          }
                                        }
                                      },
                                      text: 'Login')),
                          UIUtil.vMediumSpace(),
                          const Divider(color: dividerColor),
                          const Text('Powered By CodeSeekhlo | 2021')
                        ],
                      ),
                    ),
                  ))),
          // ),
        ],
      ),
    );
  }
}

class LoginBackground extends StatelessWidget {
  const LoginBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 4,
      left: MediaQuery.of(context).size.width / 6,
      right: MediaQuery.of(context).size.width / 6,
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width / 2,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
        child: FittedBox(
          fit: BoxFit.cover,
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
    );
  }
}
