import 'dart:async';

import 'package:brickapp/Brick.dart';
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

enum direction { UP, DOWN, LEFT, RIGHT }

class _HomePageState extends State<HomePage> {
  //ball variables
  double ballX = 0;
  double ballY = 0;
  double ballXincrements = 0.01;
  double ballYincrements = 0.01;
  var ballYDirection = direction.DOWN;
  var ballXDirection = direction.LEFT;

  //player variables
  double playerX = -0.2;
  double playerWidth = 0.4;

  //brick variables
  static double firstBrickX = -1 + wallGap;
  static double firstBrickY = -0.9;
  static double brickWidth = 0.4;
  static double brickHeight = 0.05;
  static double brickGap = 0.2;
  static int numberOfBricksInRow = 2;
  static double wallGap = 0.5 *
      (2 -
          numberOfBricksInRow * brickWidth -
          (numberOfBricksInRow - 1) * brickGap);
  bool brickBroken = false;

  List MyBricks = [
    //[x, y, broken = true/false]
    [firstBrickX, firstBrickY, false],
    [firstBrickX + brickWidth + brickGap, firstBrickY, false]
  ];

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

      //check if brick is hit
      checkForBrokenBricks();
    });
  }

  void checkForBrokenBricks() {
    //check for when ball hits bottom of the brick
    if (ballX >= MyBricks[0][0] &&
        ballX <= MyBricks[0][0] + brickWidth &&
        ballY <= MyBricks[0][1] + brickHeight &&
        brickBroken == false) {
      setState(() {
        brickBroken = true;
        ballYDirection = direction.DOWN;
      });
    }
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
      //move horizontally
      if (ballXDirection == direction.LEFT) {
        ballX -= ballXincrements;
      } else if (ballXDirection == direction.RIGHT) {
        ballX += ballXincrements;
      }

      //move vertically
      if (ballYDirection == direction.DOWN) {
        ballY += ballYincrements;
      } else if (ballYDirection == direction.UP) {
        ballY -= ballYincrements;
      }
    });
  }

  //update directon of the ball function
  void updateDirection() {
    setState(() {
      //ball goes up when it hits player
      if (ballY >= 0.9 && ballX >= playerX && ballX <= playerX + playerWidth) {
        ballYDirection = direction.UP;

        //ball goes down when it hits top fo screen
      } else if (ballY <= -1) {
        ballYDirection = direction.DOWN;
      }

      //ball goes left when it hits right wall
      if (ballX >= 1) {
        ballXDirection = direction.LEFT;
      }

      //ball goes right when it hits left wall
      else if (ballX <= -1) {
        ballXDirection = direction.RIGHT;
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
                MyBrick(
                  brickX: MyBricks[0][0],
                  brickY: MyBricks[0][1],
                  brickHeight: brickHeight,
                  brickWidth: brickWidth,
                  brickBroken: brickBroken,
                ),
                MyBrick(
                  brickX: MyBricks[1][0],
                  brickY: MyBricks[1][1],
                  brickHeight: brickHeight,
                  brickWidth: brickWidth,
                  brickBroken: brickBroken,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
