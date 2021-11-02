import 'package:flutter/material.dart';

class NavService extends StatefulWidget {
  NavService({Key? key}) : super(key: key);

  @override
  _NavServiceState createState() => _NavServiceState();
}

class _NavServiceState extends State<NavService> {
  @override
  Widget build(BuildContext context) {
    final widthMediaQuery = MediaQuery.of(context).size.width;
    final heightMediaQuery = MediaQuery.of(context).size.height;
    final paddingApp = MediaQuery.of(context).padding.top;

    final appBar = AppBar(
      backgroundColor: Colors.amber,
      automaticallyImplyLeading: false,
      title: Center(child: Text('Service')),
    );

    final bodyHeight =
        heightMediaQuery - paddingApp - appBar.preferredSize.height;
    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.amberAccent,
      body: Container(
        child: Column(
          children: [
            Container(
              height: bodyHeight * 0.3,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.center,
              child: Card(
                color: Colors.yellow.shade200,
                child: Container(
                  width: widthMediaQuery / 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('asset/ban.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      Text('Service Ban')
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: bodyHeight * 0.3,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.center,
              child: Card(
                color: Colors.yellow.shade200,
                child: Container(
                  width: widthMediaQuery / 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('asset/oli.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      Text('Service Oli')
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: bodyHeight * 0.3,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.center,
              child: Card(
                color: Colors.yellow.shade200,
                child: Container(
                  width: widthMediaQuery / 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('asset/rem.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      Text('Service Rem')
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
