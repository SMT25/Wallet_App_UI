// import 'package:banking_app_ui/pages/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:banking_app_ui/pages/login_page.dart';

// class DecisionTree extends StatefulWidget {
  
//   //const DecisionTree({Key? key}) : super(key: key);
//   @override
//   State<DecisionTree> createState() => _DecisionTreeState();
// }

// class _DecisionTreeState extends State<DecisionTree> {
//   User? user;
//   onRefresh(userCred){
//     setState(() {
//       user = userCred;
//     });
    
//   }
//   @override
//   Widget build(BuildContext context) {
//     if(user == null){
//           //return LoginPage(onSignInAno: (userCred)=>onRefresh(userCred),);
//     }
//     else{
//       return HomePage();
//     }
    
//   }
// }