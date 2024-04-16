import 'dart:async';

import 'package:brickapp/Coverscreen.dart';
import 'package:brickapp/Player.dart';
import 'package:brickapp/ball.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        ballY += 0.001;
      });
    });
  }

  //move player left
  void moveLeft() {
    setState(() {
      //move left if moving left doesn't move player off the screen
      if (!(playerX - 0.2 <= -1)) {
        playerX -= 0.2;
      }
    });
  }

  //move player right
  void moveRight() {
    setState(() {
      //move right if moving right doesn't move player off the screen
      if (!(playerX + 0.2 >= 1)) {
        playerX += 0.2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKeyEvent: (event) {
        if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          moveLeft();
        } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          moveRight();
        }
      },
      child: GestureDetector(
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

                //where is playerx exactly?
                Container(
                  alignment: Alignment(playerX, 0.9),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
