import 'package:flutter/material.dart';
import 'package:smart_service/View/BottomNavigation/Form/form_register.dart';
import 'package:smart_service/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FormRegister(),
    );
  }
}
