import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_service/View/BottomNavigation/Form/form_sigin.dart';

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
                leading: Icon(
                  Icons.person,
                  color: Colors.amber,
                ),
                title: Text('Muhammad Almuhaemin'),
                subtitle: Text('Nama Lengkap'),
              ),
              ListTile(
                leading: Icon(
                  Icons.border_color_outlined,
                  color: Colors.amber,
                ),
                title: Text('Almuhaemin'),
                subtitle: Text('Username'),
              ),
              ListTile(
                leading: Icon(
                  Icons.call,
                  color: Colors.amber,
                ),
                title: Text('Almuhaemin'),
                subtitle: Text('No Hp'),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: ElevatedButton(
                      child: Text('Edit Proflile'),
                      onPressed: () {
                        // Navigator.pushNamed(context, '');
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: ElevatedButton(
                      child: Text('LogOut'),
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.remove('username');
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (BuildContext context) => FormSignIn(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
