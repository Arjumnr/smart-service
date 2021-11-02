import 'package:flutter/material.dart';

class NavProfile extends StatefulWidget {
  NavProfile({Key? key}) : super(key: key);

  @override
  _NavProfileState createState() => _NavProfileState();
}

class _NavProfileState extends State<NavProfile> {
  @override
  Widget build(BuildContext context) {
    final widthMediaQuery = MediaQuery.of(context).size.width;
    final heightMediaQuery = MediaQuery.of(context).size.height;
    final paddingApp = MediaQuery.of(context).padding.top;

    final appBar = AppBar(
      backgroundColor: Colors.amber,
      automaticallyImplyLeading: false,
      title: Center(child: Text('Profile')),
    );

    final bodyHeight =
        heightMediaQuery - paddingApp - appBar.preferredSize.height;
    return Scaffold(
        backgroundColor: Colors.amber.shade100,
        appBar: appBar,
        body: Column(
          children: [
            Container(
              height: bodyHeight * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          // backgroundImage: AssetImage('asset/hino.png'),
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: Image.asset('asset/hino.png'),
                          ),
                        ),
                        Text(
                          'Hino 110 LD',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: bodyHeight * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Nama Lengkap  '),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Username'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Password '),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Umur '),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(':'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(':'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(':'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(':'),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Muhammad Almuhaemin Ismail'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Mimin'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('******'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('27 th')
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Edit'),
              ),
            )
          ],
        ));
  }
}
