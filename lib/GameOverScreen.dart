import 'package:flutter/material.dart';

class Gameoverscreen extends StatelessWidget {
  const Gameoverscreen({super.key, required this.isGameOver});
  final bool isGameOver;

  @override
  Widget build(BuildContext context) {
    return isGameOver
        ? Container(
            alignment: const Alignment(0, -0.3),
            child: const Text('G A M E O V E R'),
          )
        : Container();
  }
}
