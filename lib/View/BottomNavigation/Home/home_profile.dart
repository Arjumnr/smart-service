import 'package:flutter/material.dart';

class HomeProfile extends StatefulWidget {
  HomeProfile({Key? key}) : super(key: key);

  @override
  _HomeProfileState createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  TextStyle textNama = TextStyle(fontSize: 20);
  TextStyle textMerk = TextStyle(fontSize: 15);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.amber),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Muhammad Almuhaemin Ismail',
                      style: textNama,
                    ),
                    Text(
                      'Hino 110 LD',
                      style: textMerk,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
