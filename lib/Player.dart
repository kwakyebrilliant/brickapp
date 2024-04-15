import 'package:flutter/material.dart';

class MyPlayer extends StatelessWidget {
  const MyPlayer({super.key, this.player, this.playerwidth});

  final player;
  final playerwidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(player, 0.0),
      child: Container(
        height: 10.0,
        width: MediaQuery.of(context).size.width * playerwidth / 2,
        color: Colors.teal,
      ),
    );
  }
}
