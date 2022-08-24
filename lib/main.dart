import 'package:banking_app_ui/pages/cupertino.dart';
import 'package:banking_app_ui/pages/home_page.dart';
import 'package:banking_app_ui/pages/motupage.dart';
import 'package:banking_app_ui/pages/testpracpage.dart';
import 'package:banking_app_ui/pages/cupertinobutton.dart';
import 'package:banking_app_ui/pages/testpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(LikeWallet());
}

class LikeWallet extends StatelessWidget {
   LikeWallet({Key? key}) : super(key: key);
   

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home:HomePage(),
      // home:TestPracPage(),
      //home:TestPage(),
      // home:Cupertino(),
      // home:CupertinoBtn(),
      // home:MotuPage(),
    );
  }
}
