import 'dart:async';

import 'package:flutter/material.dart';

import 'View/BottomNavigation/Form/form_sigin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    starSplashScreen();
  }

  starSplashScreen() async {
    var duration = const Duration(seconds: 2);

    return Timer(duration, () {
      Navigator.pushNamed(context, '/signIn');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
          child: SizedBox(
        width: 200,
        height: 200,
        child: Image.asset('asset/logoSS.png'),
      )),
    );
  }
}
