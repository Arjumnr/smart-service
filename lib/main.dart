import 'package:flutter/material.dart';
import 'package:smart_service/View/BottomNavigation/Form/form_sigin.dart';
import 'package:smart_service/View/BottomNavigation/Form/form_signup.dart';
import 'package:smart_service/View/BottomNavigation/bottom_navigation.dart';
import 'package:smart_service/splash_screen.dart';

import 'View/BottomNavigation/Form/form_kendaraan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/signIn': (BuildContext) => new FormSignIn(),
        '/signUp': (BuildContext) => new FormSignUp(),
        '/pilihKendaraan': (BuildContext) => new PilihKendaraan(),
        '/bottomNavigation': (BuildContext) => new BottomNavigation(),
      },
    );
  }
}
