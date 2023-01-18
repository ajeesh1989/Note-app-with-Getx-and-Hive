import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'lib/images/splash.jpg',
                height: 1000,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'S C R I B B L E S',
                style: GoogleFonts.amarante(
                  fontSize: 35,
                  color: Colors.black,
                  textStyle: const TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 40.0,
                        color: Colors.black,
                        offset: Offset(10.0, 10.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
