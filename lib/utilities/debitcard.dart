import 'package:flutter/material.dart';

class debitCard extends StatefulWidget {
  const debitCard({Key? key}) : super(key: key);

  @override
  State<debitCard> createState() => _debitCardState();
}

class _debitCardState extends State<debitCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding: const EdgeInsets.symmetric(horizontal:8.0),
      padding: EdgeInsets.all(5.0),
      child: Container(
        
  width: MediaQuery.of(context).size.width * 0.60,
  height: MediaQuery.of(context).size.height * 0.16,
  padding: EdgeInsets.all(5.0),
  decoration: BoxDecoration(
      color: Color.fromARGB(255, 147, 141, 112),
      borderRadius: BorderRadius.circular(12.0),
      ),
child: Column(
  
  mainAxisAlignment: MainAxisAlignment.end
  
  ,children: [
Row(children: 
[SizedBox(height: 20),
  Text('Balance',
style: TextStyle(color: Colors.white),
),
Text('\$5500',
style: TextStyle(fontSize: 26,color: Colors.white38),
),
],
),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
      Text('Talha',
style: TextStyle(color: Colors.white),
      
      ),
Text('*****2245',

style: TextStyle(color: Colors.white),
),
Text('10/24',
style: TextStyle(color: Colors.white),


),

],)
,

SizedBox(height: 5),],
),


),
    );
  }
}



