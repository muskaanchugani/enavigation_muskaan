import 'package:flutter/material.dart';
import 'package:untitled6/pages/loginpage.dart';
import 'package:untitled6/pages/registerpage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage=true;

  void togglescreens()
  {
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage) return LoginPage(showRegisterPage:togglescreens);
    else return RegisterPage(showLoginPage:togglescreens);
  }
}
