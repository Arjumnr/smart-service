import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smart_service/View/BottomNavigation/Form/form_sigin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../services.dart';

class NavProfile extends StatefulWidget {
  NavProfile({Key? key}) : super(key: key);

  @override
  _NavProfileState createState() => _NavProfileState();
}

Future<Map<String, dynamic>> _fetchDataUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var id = prefs.getInt('id');
  var url = Uri.parse(SHOW_USER + '/${id}');
  print(url);
  var response = await http.get(url);
  return json.decode(response.body);
}

class _NavProfileState extends State<NavProfile> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.amber,
      automaticallyImplyLeading: false,
      title: Center(child: Text('Profile')),
    );

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

    Widget box() {
      return Container(
        height: 300,
        width: 500,
        color: Colors.grey,
      );
    }

    dataProfil() {
      return Container(
        child: Card(
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: FutureBuilder<Map<String, dynamic>>(
              future: _fetchDataUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Colors.amber,
                        ),
                        title: Text(snapshot.data!['data']['nama_lengkap']),
                        subtitle: Text('Nama Lengkap'),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.border_color_outlined,
                          color: Colors.amber,
                        ),
                        title: Text(snapshot.data!['data']['username']),
                        subtitle: Text('Username'),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.call,
                          color: Colors.amber,
                        ),
                        title: Text(snapshot.data!['data']['no_hp']),
                        subtitle: Text('No Hp'),
                      ),
                    ],
                  );
                } else {
                  return Shimmer.fromColors(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.amber,
                          ),
                          title: Text(''),
                          subtitle: Text(''),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.border_color_outlined,
                            color: Colors.amber,
                          ),
                          title: Text(''),
                          subtitle: Text(''),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.call,
                            color: Colors.amber,
                          ),
                          title: Text(''),
                          subtitle: Text(''),
                        ),
                      ],
                    ),
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white,
                  );
                }
              },
            )),
      );
    }

    body() {
      return Column(
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
      );
    }

    return Scaffold(
        backgroundColor: Colors.amber.shade100,
        appBar: appBar,
        body: SafeArea(child: body()));
  }
}
