import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:banking_app_ui/pages/nidopage.dart';

class MotuPage extends StatefulWidget {
   MotuPage({Key? key}) : super(key: key);
    
  @override
  State<MotuPage> createState() => _MotuPageState();
}

class _MotuPageState extends State<MotuPage> {
  String btnName = 'Press';
  int crntIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Chota Mota Motu"),
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
      ),
        body: Center(
          child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                        return NidoPage();

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
