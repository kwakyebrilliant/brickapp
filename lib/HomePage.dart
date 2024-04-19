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

enum direction { UP, DOWN }

class _HomePageState extends State<HomePage> {
  //ball variables
  double ballX = 0;
  double ballY = 0;
  var ballDirection = direction.DOWN;

  //player variables
  double playerX = -0.2;
  double playerwidth = 0.4;

  //game settings
  bool hasGameStarted = false;

  //startGame method
  void startGame() {
    hasGameStarted = true;
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      //update direction
      updateDirection();

      //move ball
      moveBall();
    });
  }

  //move ball the ball function
  void moveBall() {
    setState(() {
      if (ballDirection == direction.DOWN) {
        ballY += 0.01;
      } else if (ballDirection == direction.UP) {
        ballY -= 0.01;
      }
    });
  }

  //update directon of the ball function
  void updateDirection() {
    setState(() {
      if (ballY >= 0.9 && ballX >= playerX && ballX <= playerX + playerwidth) {
        ballDirection = direction.UP;
      } else if (ballY <= -0.9) {
        ballDirection = direction.DOWN;
      }
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
      if (!(playerX + 2 * playerwidth >= 1)) {
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
                  playerX: playerX,
                  playerwidth: playerwidth,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
