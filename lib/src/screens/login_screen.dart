import 'package:flutter/material.dart';
import 'package:hello_world/src/shared/widgets/large_text_field.dart';
import 'package:hello_world/src/shared/widgets/logo.dart';

import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  static String tag = 'login-screen';

  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        key: Key('submitBtn'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        onPressed: () {
          _submit(context);
        },
        padding: EdgeInsets.all(12),
        color: Colors.purple,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );
    final forgotBtn = FlatButton(
      key: Key('forgotBtn'),
      child: Text('Forgot password?', style: TextStyle(color: Colors.black54)),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            Logo(),
            SizedBox(height: 100.0),
            LargeTextField(
              controller: emailController,
              keyText: 'emailField',
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              hideText: false,
            ),
            SizedBox(height: 8.0),
            LargeTextField(
              controller: emailController,
              keyText: 'passwordField',
              hintText: 'Password',
              keyboardType: TextInputType.text,
              hideText: true,
            ),
            SizedBox(height: 24.0),
            loginButton,
            forgotBtn
          ],
        ),
      ),
    );
  }

  _submit(BuildContext context) async {
    Navigator.pushReplacementNamed(context, MainScreen.tag);
  }
}
