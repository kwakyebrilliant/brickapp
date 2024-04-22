import 'package:flutter/material.dart';

class MyBrick extends StatelessWidget {
  const MyBrick(
      {super.key,
      this.brickHeight,
      this.brickWidth,
      this.brickX,
      this.brickY,
      required this.brickBroken});
  final brickX;
  final brickY;
  final brickHeight;
  final brickWidth;
  final bool brickBroken;

  @override
  Widget build(BuildContext context) {
    return brickBroken
        ? Container()
        : Container(
            alignment: Alignment(brickX, brickY),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                height: MediaQuery.of(context).size.height * brickHeight / 2,
                width: MediaQuery.of(context).size.width * brickWidth / 2,
                color: Colors.teal,
              ),
            ),
          );
  }
}
