import 'package:flutter/material.dart';

class NavProfile extends StatefulWidget {
  NavProfile({Key? key}) : super(key: key);

  @override
  _NavProfileState createState() => _NavProfileState();
}

class _NavProfileState extends State<NavProfile> {
  @override
  Widget build(BuildContext context) {
    // final widthMediaQuery = MediaQuery.of(context).size.width;
    // final heightMediaQuery = MediaQuery.of(context).size.height;
    // final paddingApp = MediaQuery.of(context).padding.top;

    // final String ket, profil;
    // final IconData icon;
    final appBar = AppBar(
      backgroundColor: Colors.amber,
      automaticallyImplyLeading: false,
      title: Center(child: Text('Profile')),
    );

    // final bodyHeight =
    //     heightMediaQuery - paddingApp - appBar.preferredSize.height;

    imageProfil() {
      return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset('asset/hino.png'),
              ),
            ),
            Text('Hino 110 LD'),
          ],
        ),
      );
    }

    dataProfil() {
      return Container(
        child: Card(
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.ac_unit),
                title: Text('Muhammad Almuhaemin'),
                subtitle: Text('Nama Lengkap'),
                contentPadding: EdgeInsets.only(bottom: 10),
              ),
              ListTile(
                leading: Icon(Icons.ac_unit),
                title: Text('Almuhaemin'),
                subtitle: Text('Username'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: Colors.amber.shade100,
        appBar: appBar,
        body: SafeArea(
          child: Column(
            children: [
              imageProfil(),
              dataProfil(),
            ],
          ),
        ));
  }
}
