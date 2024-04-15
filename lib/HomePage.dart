import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //ball variables
  double ballX = 0;
  double ballY = 0;

  //startGame method
  void startGame() {
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        ballY -= 0.1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: startGame,
      child: Scaffold(
        backgroundColor: Colors.teal[100],
        body: Center(
          child: Stack(
            children: [
              //tap to play'
              Container(
                alignment: Alignment(0, -0.2),
                child: Text(
                  'Tap to play',
                  style: TextStyle(color: Colors.teal[500]),
                ),
              ),

              //ball
              Container(
                alignment: Alignment(ballX, ballY),
                child: Container(
                  height: 15.0,
                  width: 15.0,
                  decoration: const BoxDecoration(
                    color: Colors.teal,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
