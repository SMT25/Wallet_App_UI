import 'dart:ui';
import 'package:banking_app_ui/auth/ownauth.dart';
import 'package:banking_app_ui/pages/userprofilepage.dart';
import 'package:banking_app_ui/utilities/dc.dart';
import 'package:banking_app_ui/utilities/debitcard.dart';
import 'package:banking_app_ui/utilities/listTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:banking_app_ui/utilities/imageButton.dart';
import 'package:banking_app_ui/utilities/listTile.dart';
class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

 
}

class _HomePageState extends State<HomePage> {
  //pagecontroller
  final _controller = PageController();
  final int cardCount = 4;

     final User? user = OwnAuth().currentUser;

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Future<void> signOut() async {
    await OwnAuth().signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(onPressed: () {
        //  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
        //                   return OrderTrackingPage();
    
        //                   },
        //                   ),
        //                   );
      },
      backgroundColor: Colors.pink,
      child: Icon(Icons.monetization_on),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          
          children: [
          Icon(Icons.home,size: 50,),
          GestureDetector(onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                          return userProfilePage();
    
                          },
                          ),
                          );
          },
            child: Icon(Icons.person,size: 50,)),
          Icon(Icons.settings,size: 50,),
          GestureDetector(
            onTap: signOut,
            child: Icon(Icons.logout,size: 50,),
            ),
        ],),
        
        ),
      body: SafeArea(
        //In case of notch screen, safe area is used to place content from full available screen of the phone.
        child: Column(
          children: [
            //appbar
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'My',
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: ' Cards',
                            style: TextStyle(
                                fontSize: 26,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      ],
                    ),

                    Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add)),
                    //add icon
                    //Expanded(child: Icon(Icons.add)),
                  ]),
            ),

            SizedBox(height: 20),

            //cards
            Row(
              children: [
                Container(
                  color: Color.fromARGB(255, 249, 249, 249).withOpacity(0.5),
                  padding: EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.28,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    children: [
                      //debitCard(),
                      //debitCard(),

                      dcPage(
                          cardBalance: 35653.00,
                          cardNumber: '4221201234567890',
                          cardName: _userUid(),
                          expiryMonth: 10,
                          expiryYear: 25,
                          color: Colors.teal),
                      dcPage(
                          cardBalance: 65653.00,
                          cardNumber: '4221201234587458',
                          cardName: _userUid(),
                          expiryMonth: 08,
                          expiryYear: 23,
                          color: Colors.blueGrey),
                      dcPage(
                          cardBalance: 1653.00,
                          cardNumber: '42212012343223451',
                          cardName: _userUid(),
                          expiryMonth: 08,
                          expiryYear: 23,
                          color: Colors.black),
                      debitCard(),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),

                SmoothPageIndicator(
                  controller: _controller,
                  count: cardCount,
                  effect: ExpandingDotsEffect(),
                ), //third argument is optional
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    imageButton(
                        buttonImagePath: 'images/money_transfer.png',
                        buttonText: 'Send Money'),
                  ],
                ),
                Column(
                  children: [
                    imageButton(
                        buttonImagePath: 'images/paycheque.png',
                        buttonText: 'Bill Payment'),
                  ],
                ),
                Column(
                  children: [
                    imageButton(
                        buttonImagePath: 'images/deposit.png',
                        buttonText: 'Deposit'),
                  ],
                ),
              ],
            ),

            //column -> stats + transactions

            listTile(tileImagePath: 'images/stats.png', tileMainText: 'Statistics', tileSubText: 'Payments & Income',Icons: Icons.arrow_forward_ios),
            listTile(tileImagePath: 'images/transaction1.png', tileMainText: 'Transactions', tileSubText: 'Transaction History',Icons: Icons.arrow_forward_ios),
          ],
        ),

        
      ),
    );
  }
}
