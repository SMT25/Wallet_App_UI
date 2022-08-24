import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class imageButton extends StatelessWidget {
  final String buttonImagePath;
  final String buttonText;
  const imageButton({Key? key,
  required this.buttonImagePath,
  required this.buttonText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              
                      padding:EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white.withOpacity(0.3),
                      boxShadow: [BoxShadow(
                      color: Colors.blueGrey,
                      blurRadius: 2,
                      spreadRadius: 1),
                      ],
                      
                    ),
                   
                    
              height: 100,
              width: MediaQuery.of(context).size.width * 0.30,
              //color: Colors.amber,
              child: Image.asset(buttonImagePath),
            
            ),
            SizedBox(height:5),
    Text(buttonText,
    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
    ),
          ],
        ),
      ],
    );
    
  }
}