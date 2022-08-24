import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:banking_app_ui/pages/testpage.dart';
class TestPracPage extends StatefulWidget {
  TestPracPage({Key? key}) : super(key: key);

  @override
  State<TestPracPage> createState() => _TestPracPageState();
}

class _TestPracPageState extends State<TestPracPage> {
  String btnName = 'Click';
  int crntIndex = 0;
  bool _isClicked = true;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Like's Wallet"),
        backgroundColor: Colors.blueGrey,
      ),
      body: crntIndex == 0
          ? Container(
              //if statement applied here
              color: Color.fromARGB(255, 5, 156, 156),

              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Counter : ${counter}'),

                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              //btnName = 'Clicked';
                              counter++;
                            });
                          }, // these are used to call/make an empty function
                          child: Text('+'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              
                              counter != 0 ? counter-- : counter = 0;
                            });
                          }, // these are used to call/make an empty function
                          child: Text('-'),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        // ElevatedButton(
                        //   style: ElevatedButton.styleFrom(
                        //     onPrimary: Colors.white,
                        //     primary: Colors.tealAccent.shade400,
                        //     onSurface: Colors.black,
                        //     surfaceTintColor: Color.fromARGB(255, 3, 2, 0),

                        //   ),
                        //   onPressed: () {
                        //     setState(() {
                        //       btnName = 'Clicked';
                        //     });
                        //   },// these are used to call/make an empty function
                        //   child: Text(btnName),
                        // ),

                        CupertinoButton.filled(
                          onPressed: () {},
                          child: const Text('Enabled'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              btnName = 'Clicked';
                            });
                          }, // these are used to call/make an empty function
                          child: Text(btnName),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : //colon used for else
          Container(
              child: Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isClicked = !_isClicked;
                        });
                      },
                      child: _isClicked ? 
                      Image.asset("images/ios_setting.jpg")
                      : Image.asset("images/like_icon.png")
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                          return TestPage();
    
                          },
                          ),
                          ),
                      child: Image.asset("images/ios_setting.jpg"),
                    ),
                  ],
                ),
              ],
            )),
      bottomNavigationBar: BottomNavigationBar(
        items: const //added const to to remove blue line, it sets the value as constant
            [
          BottomNavigationBarItem(
              backgroundColor: Colors.blueGrey,
              label: 'Home',
              // icon: Icon(Icons.home)),
              icon: Icon(CupertinoIcons.bell_slash_fill)),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: ImageIcon(
              AssetImage("images/ios_setting.jpg"),
              //color: Color(0xFF3A5A98),
            ),

            // backgroundColor: Colors.blueGrey,
            // label: 'Settings',
            // icon: Icon(Icons.settings)
          )
        ],
        currentIndex: crntIndex,
        onTap: (int index) {
          setState(() {
            crntIndex = index;
          });
        },
      ),
    );
  }
}
