import 'package:flutter/material.dart';

class MyPlayer extends StatelessWidget {
  const MyPlayer({super.key, this.player, this.playerwidth});

  final player;
  final playerwidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(player, 0.9),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: 10.0,
          width: MediaQuery.of(context).size.width * playerwidth / 2,
          color: Colors.teal,
        ),
      ),
    );
  }
}
