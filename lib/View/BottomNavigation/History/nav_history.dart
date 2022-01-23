import 'package:flutter/material.dart';

class NavHistory extends StatefulWidget {
  NavHistory({Key? key}) : super(key: key);

  @override
  _NavHistoryState createState() => _NavHistoryState();
}

class _NavHistoryState extends State<NavHistory> {
  @override
  Widget build(BuildContext context) {
    // final widthMediaQuery = MediaQuery.of(context).size.width;
    // final heightMediaQuery = MediaQuery.of(context).size.height;
    // final paddingApp = MediaQuery.of(context).padding.top;

    final appBar = AppBar(
      backgroundColor: Colors.amber,
      automaticallyImplyLeading: false,
      title: Center(child: Text('History Service')),
    );

    // final bodyHeight =
    // heightMediaQuery - paddingApp - appBar.preferredSize.height;
    return Scaffold(
        backgroundColor: Colors.amber.shade100,
        appBar: appBar,
        body: Container(
            padding: EdgeInsets.all(5),
            child: ListView(children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber.shade300),
                child: ListTile(
                  title: Text(
                    'Ban',
                  ),
                  subtitle: Text('GT Radial'),
                  leading: CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage('asset/ban.png'),
                    backgroundColor: Colors.amber.shade50,
                  ),
                  trailing: Text('10-01-2022'),
                ),
              ),
            ])));
  }
}
