import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Gameoverscreen extends StatelessWidget {
  const Gameoverscreen({super.key, required this.isGameOver, this.function});
  final bool isGameOver;
  final function;

  //font
  static var gameFont = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
          color: Colors.teal, letterSpacing: 0, fontSize: 28.0));

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
