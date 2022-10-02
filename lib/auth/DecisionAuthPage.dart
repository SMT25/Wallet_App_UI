import 'package:banking_app_ui/pages/login_page.dart';
import 'package:banking_app_ui/pages/register_page.dart';
import 'package:flutter/material.dart';

class DecisionAuthPage extends StatefulWidget {
  const DecisionAuthPage({Key? key}) : super(key: key);

  @override
  State<DecisionAuthPage> createState() => _DecisionAuthPageState();
}

class _DecisionAuthPageState extends State<DecisionAuthPage> {

  //initially show the login page
  bool showLoginPage = true;

  void toggleScreens() {
      setState(() {
        showLoginPage = !showLoginPage;
      });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(showRegisterPage: toggleScreens);
      
    }else{ return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}