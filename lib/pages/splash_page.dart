import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // logika loading Splash & onboarding
  @override
  void initState() {
    Timer(
      const Duration(
        seconds: 3,
      ),
      () => Navigator.pushReplacementNamed(context, '/menu'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // ganti warna background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/notes.png',
              width: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Notes App',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            // const CircularProgressIndicator(
            //   color: Colors.purple,
            // ),
          ],
        ),
      ),
    );
  }
}
