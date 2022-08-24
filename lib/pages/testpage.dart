import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:banking_app_ui/pages/cupertinobutton.dart';

class TestPage extends StatefulWidget {
   TestPage({Key? key}) : super(key: key);
    
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String btnName = 'Click';
  int crntIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Like's Wallet"),
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: true,
      ),
        body: Center(
          child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                        return CupertinoBtn();

                        },
                        ),
                        );
                      },// these are used to call/make an empty function
                      child: Text('Test'),
                    ),
        ),

    );
  }
}
