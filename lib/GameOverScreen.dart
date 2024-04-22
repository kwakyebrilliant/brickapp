import 'package:flutter/material.dart';

class Gameoverscreen extends StatelessWidget {
  const Gameoverscreen({super.key, required this.isGameOver, this.function});
  final bool isGameOver;
  final function;

  @override
  Widget build(BuildContext context) {
    return isGameOver
        ? Stack(
            children: [
              Container(
                alignment: const Alignment(0, -0.3),
                child: const Text(
                  'G A M E   O V E R',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
              Container(
                alignment: const Alignment(0, 0),
                child: GestureDetector(
                  onTap: function,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      color: Colors.teal,
                      child: const Text(
                        'PLAY AGAIN',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        : Container();
  }
}
