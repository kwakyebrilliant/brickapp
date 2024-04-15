import 'dart:async';

import 'package:brickapp/Coverscreen.dart';
import 'package:brickapp/Player.dart';
import 'package:brickapp/ball.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //ball variables
  double ballX = 0;
  double ballY = 0;

  //player variables
  double playerX = 0;
  double playerwidth = 0.3;

  //game settings
  bool hasGameStarted = false;

  //startGame method
  void startGame() {
    hasGameStarted = true;
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        ballY -= 0.1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: startGame,
      child: Scaffold(
        backgroundColor: Colors.teal[100],
        body: Center(
          child: Stack(
            children: [
              //tap to play
              CoverScreen(
                hasGameStarted: hasGameStarted,
              ),

              //ball
              MyBall(
                ballX: ballX,
                ballY: ballY,
              ),

              //player
              MyPlayer(
                player: playerX,
                playerwidth: playerwidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
