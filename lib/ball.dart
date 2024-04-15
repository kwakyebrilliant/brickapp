import 'package:flutter/material.dart';

class MyBall extends StatelessWidget {
  const MyBall({super.key, this.ballX, this.ballY});

  final ballX;
  final ballY;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(ballX, ballY),
      child: Container(
        height: 15.0,
        width: 15.0,
        decoration: const BoxDecoration(
          color: Colors.teal,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
