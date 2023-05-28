import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int user = 0;
  int system = 0;

  int scoreYou = 0;
  int scoreSystem = 0;

  void go(choices) {
    setState(() {
      user = choices;
      system = Random().nextInt(3);
      winner();
    });
  }

  /// (0) Paper, (1) Rock, (2) Scissors.
  void winner() {
    if (user == 0 && system == 2 ||
        user == 1 && system == 0 ||
        user == 2 && system == 1) {
      scoreSystem++;
    } else if (user != system) {
      scoreYou++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff454555),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Rock Paper Scissors',
          style: GoogleFonts.roboto(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/image$user.png',
                    width: 160,
                    height: 160,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'You',
                    style: GoogleFonts.roboto(
                      fontSize: 26,
                      color: Colors.tealAccent,
                    ),
                  ),
                ],
              ),
              Text(
                'VS',
                style: GoogleFonts.roboto(
                  fontSize: 36,
                  color: Colors.tealAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/image$system.png',
                    width: 160,
                    height: 160,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'System',
                    style: GoogleFonts.roboto(
                      fontSize: 26,
                      color: Colors.tealAccent,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton(
                onPressed: () {
                  setState(() => go(0));
                },
                child: Image.asset('assets/images/image0.png',
                    width: 70, height: 70),
              ),
              TextButton(
                onPressed: () {
                  setState(() => go(1));
                },
                child: Image.asset('assets/images/image1.png',
                    width: 70, height: 70),
              ),
              TextButton(
                onPressed: () {
                  setState(() => go(2));
                },
                child: Image.asset('assets/images/image2.png',
                    width: 70, height: 70),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
