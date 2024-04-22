import 'dart:async';

import 'package:brickapp/Coverscreen.dart';
import 'package:brickapp/GameOverScreen.dart';
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
  double playerWidth = 0.4;

  //game settings
  bool hasGameStarted = false;
  bool isGameOver = false;

  //startGame method
  void startGame() {
    hasGameStarted = true;
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      //update direction
      updateDirection();

      //move ball
      moveBall();

      //check if player is dead
      if (isPlayerDead()) {
        timer.cancel();
        isGameOver = true;
      }
    });
  }

  //is player dead
  bool isPlayerDead() {
    // player dies if it ball reaches the bottom of the screen
    if (ballY >= 1) {
      return true;
    }
    return false;
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
      if (ballY >= 0.9 && ballX >= playerX && ballX <= playerX + playerWidth) {
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
      if (!(playerX - 0.2 < -1)) {
        playerX -= 0.2;
      }
    });
  }

  //move player right
  void moveRight() {
    setState(() {
      //move right if moving right doesn't move player off the screen
      if (!(playerX + 1 * playerWidth >= 1)) {
        playerX += 0.2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event) {
        // ignore: deprecated_member_use
        if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          moveLeft();
          // ignore: deprecated_member_use
        } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
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

                //game over screen
                Gameoverscreen(isGameOver: isGameOver),

                //ball
                MyBall(
                  ballX: ballX,
                  ballY: ballY,
                ),

                //player
                MyPlayer(
                  playerX: playerX,
                  playerWidth: playerWidth,
                ),

                //bricks
                Container(
                  alignment: const Alignment(0, -0.9),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      height: 20.0,
                      width: 50.0,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
