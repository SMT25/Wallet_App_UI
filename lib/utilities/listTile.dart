import 'package:flutter/material.dart';

class listTile extends StatelessWidget {
  final String tileImagePath;
  final String tileMainText;
  final String tileSubText;
  final Icons;
  const listTile({Key? key,
  required this.tileImagePath,
  required this.tileMainText,
  required this.tileSubText,
  required this.Icons
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white.withOpacity(0.3),
                              
                            ),
                            child: Image.asset(tileImagePath),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(tileMainText,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Text(tileSubText,style: TextStyle(fontSize: 16,color: Colors.grey),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons),
                    ],
                  ),
                ],
              ),
            );
  }
}