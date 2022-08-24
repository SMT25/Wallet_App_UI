import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:banking_app_ui/pages/motupage.dart';

class NidoPage extends StatefulWidget {
   NidoPage({Key? key}) : super(key: key);
    
  @override
  State<NidoPage> createState() => _NidoPageState();
}

class _NidoPageState extends State<NidoPage> {
  String btnName = 'Press';
  int crntIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Humaley Nido Tey Dabbay :D"),
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
      ),
        body: Center(
          child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                        return MotuPage();

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
