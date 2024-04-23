import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class MyBall extends StatelessWidget {
  const MyBall(
      {super.key,
      this.ballX,
      this.ballY,
      required this.isGameOver,
      required this.hasGameStarted});

  final ballX;
  final ballY;
  final bool isGameOver;
  final bool hasGameStarted;

  @override
  Widget build(BuildContext context) {
    return hasGameStarted
        ? Container(
            alignment: Alignment(ballX, ballY),
            child: Container(
              height: 10.0,
              width: 10.0,
              decoration: BoxDecoration(
                color: isGameOver ? Colors.teal[400] : Colors.teal,
                shape: BoxShape.circle,
              ),
            ),
          )
        : Container(
            alignment: Alignment(ballX, ballY),
            child: AvatarGlow(
              glowRadiusFactor: 5.0,
              glowColor: Colors.teal,
              duration: const Duration(milliseconds: 2000),
              repeat: true,
              child: Material(
                elevation: 8.0,
                shape: const CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.teal[100],
                  radius: 7.0,
                  child: Container(
                    height: 15.0,
                    width: 15.0,
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
