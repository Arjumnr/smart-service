import 'package:flutter/material.dart';
import 'package:smart_service/View/BottomNavigation/Home/home_profile.dart';
import 'package:smart_service/View/BottomNavigation/Home/home_slide.dart';

import 'home_status_service.dart';

class NavHome extends StatefulWidget {
  NavHome({Key? key}) : super(key: key);

  @override
  _NavHomeState createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
  @override
  Widget build(BuildContext context) {
    // final widthMediaQuery = MediaQuery.of(context).size.width;
    final heightMediaQuery = MediaQuery.of(context).size.height;
    final paddingApp = MediaQuery.of(context).padding.top;

    final appBar = AppBar(
      backgroundColor: Colors.amber,
      automaticallyImplyLeading: false,
      title: Center(child: Text('Home')),
    );
    final bodyHeight =
        heightMediaQuery - paddingApp - appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.amber.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  child: HomeProfile(),
                ),
                Container(
                  height: bodyHeight * 0.3,
                  child: HomeSlide(),
                ),
                Container(
                  height: bodyHeight * 0.4,
                  child: HomeStatusService(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
