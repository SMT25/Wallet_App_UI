import 'package:banking_app_ui/pages/home_page.dart';
import 'package:banking_app_ui/pages/login_page.dart';
import 'package:banking_app_ui/pages/login_register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_core/firebase_core.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
       if (snapshot.hasData){
          return HomePage();
        }
        else {
          return LoginPagee();
        }
      },
    );
    // return Scaffold(
    //   body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
    //   builder:(context, snapshot) {
    //     if (snapshot.hasData){
    //       return HomePage();
    //     }
    //     else {
    //       return LoginPage();
    //     }
    //   }
      
      
    //   ),
    // );
    
  
  }
}