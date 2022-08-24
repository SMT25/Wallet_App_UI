import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class dcPage extends StatelessWidget {
  final double cardBalance;
  final String cardNumber;
  final String cardName;
  final int expiryMonth;
  final int expiryYear;
  final color;
  const dcPage(
      {Key? key,
      required this.cardBalance,
      required this.cardNumber,
      required this.cardName,
      required this.expiryMonth,
      required this.expiryYear,
      required this.color})
      : super(key: key);

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
          color: color, //Color.fromARGB(255, 147, 141, 112
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                'Balance',
                style: TextStyle(color: Colors.white),
                ),
                Image.asset('images/mastercard-logo.png',height: 50,),
                
                
              ],
            ),
            Row(
              children: [
                Text(
                      '\$' + cardBalance.toString(),
                      style: TextStyle(fontSize: 26, color: Colors.white38,fontWeight: FontWeight.bold),
                    ),
              ],
            ),
            Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
                Text(
                  cardNumber.substring(0, 6) +
                      '******' +
                      cardNumber.substring(12),
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  expiryMonth.toString() + '/' + expiryYear.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  cardName,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
