import 'package:flutter/material.dart';
class SliverAppBarTest extends StatefulWidget {
  const SliverAppBarTest({Key? key}) : super(key: key);

  @override
  State<SliverAppBarTest> createState() => _SliverAppBarTestState();
}

class _SliverAppBarTestState extends State<SliverAppBarTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(floating: true,
          title: Text('Test'),
          ),
          SliverList(delegate: SliverChildListDelegate([
            Container(

            ),
          ],
          ),
          )
        
        ], 
      ),

    );
  }
}
