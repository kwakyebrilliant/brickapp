import 'package:flutter/material.dart';

class MyPlayer extends StatelessWidget {
  const MyPlayer({super.key, this.playerX, this.playerWidth});

  final playerX;
  final playerWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:
          Alignment((2 * playerX + playerWidth) / (2 - playerWidth), 0.9),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: 10.0,
          width: MediaQuery.of(context).size.width * playerWidth / 2,
          color: Colors.teal,
        ),
      ),
    );
  }
}
