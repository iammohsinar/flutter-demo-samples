import 'package:desktop_library_shop/core/enums/state_enums.dart';
import 'package:desktop_library_shop/core/viewmodels/auth_bo.dart';
import 'package:desktop_library_shop/ui/views/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<AuthBo>(
        builder: (context, model, child) => Scaffold(
              body: Container(
                child: Column(
                  children: [
                    const Text('user:Mohsin pass:123456 '),
                    (model.state == StateEnum.busy)
                        ? CircularProgressIndicator(
                            value: null,
                          )
                        : ElevatedButton(
                            onPressed: () async {
                              var success = await model.login('mohsin', '1234563');
                              print(success);
                              if (success) Navigator.pushNamed(context, '/');
                            },
                            child: Text('login'))
                  ],
                ),
              ),
            ));
  }
}
