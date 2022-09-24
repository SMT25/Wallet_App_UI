import 'package:flutter/material.dart';
class BouncingButton extends StatefulWidget {
  late final String BounceButtonText;
  @override
  _BouncingButtonState createState() => _BouncingButtonState();
}
class _BouncingButtonState extends State<BouncingButton> with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }
@override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
@override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return             Container(
      child: GestureDetector(
        onTapDown: _tapDown,
        onTapUp: _tapUp,
        child: Transform.scale(
          scale: _scale,
          child: _animatedButton(),
        ),
      ),
    );
          
  }
Widget  _animatedButton() {
    return Container(
      height: 40,
      //width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          boxShadow: [
            BoxShadow(
              color: Color(0x80000000),
              blurRadius: 12.0,
              offset: Offset(0.0, 5.0),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFB39DDB),
              Color(0xFFB39DDB),
            ],
          )),
      child: Center(
        child: Text(
          'Reset Password',
          style: TextStyle(
              fontSize: 20.0,
             
              color: Colors.white),
        ),
      ),
    );
  }
void _tapDown(TapDownDetails details) {
    _controller.forward();
  }
void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }
}