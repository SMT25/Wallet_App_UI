import 'package:flutter/cupertino.dart';
import 'package:banking_app_ui/pages/testpage.dart';
import 'package:flutter/material.dart';
class CupertinoBtn extends StatelessWidget {
  const CupertinoBtn({Key? key}) : super(key: key);

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
              child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const CupertinoButton(
              onPressed: null,
              child: Text('Disabled'),
            ),
            const SizedBox(height: 30),
            const CupertinoButton.filled(
              onPressed: null,
              child: Text('Disabled'),
            ),
            const SizedBox(height: 30),
            CupertinoButton(
              onPressed: () {},
              child: const Text('Enabled'),
            ),
            const SizedBox(height: 30),
            CupertinoButton.filled(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                          return TestPage();
    
                          },
                          ),
                          );
              },
              child: const Text('Enabled'),
            ),
          ],
        ),
      ),
    );
  }
}