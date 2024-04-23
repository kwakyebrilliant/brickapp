import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoverScreen extends StatelessWidget {
  const CoverScreen({super.key, required this.hasGameStarted});

  final bool hasGameStarted;

  //font
  static var gameFont = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
          color: Colors.teal, letterSpacing: 0, fontSize: 28.0));

  @override
  Widget build(BuildContext context) {
    return hasGameStarted
        ? Container()
        : Stack(
            children: [
              Container(
                alignment: const Alignment(0, -0.5),
                child: Text(
                  'BRICKAPP',
                  style: gameFont,
                ),
              ),
              Container(
                alignment: const Alignment(0, -0.1),
                child: Text(
                  'Tap to play',
                  style: TextStyle(color: Colors.teal[500]),
                ),
              ),
            ],
          );
  }
}
