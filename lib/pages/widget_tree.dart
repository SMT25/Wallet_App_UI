import 'package:banking_app_ui/auth/ownauth.dart';
import 'package:banking_app_ui/auth/DecisionAuthPage.dart';
import 'package:banking_app_ui/pages/home.dart';
import 'package:banking_app_ui/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: OwnAuth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return const DecisionAuthPage();
        }
      },
    );
  }
}