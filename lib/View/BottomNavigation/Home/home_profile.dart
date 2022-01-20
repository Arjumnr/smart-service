import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:smart_service/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeProfile extends StatefulWidget {
  HomeProfile({Key? key}) : super(key: key);

  @override
  _HomeProfileState createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  TextStyle textNama = TextStyle(fontSize: 20);
  TextStyle textMerk = TextStyle(fontSize: 15);

  Future<Map<String, dynamic>> _fetchDataUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt('id');
    var url = Uri.parse(SHOW_USER + '/${id}');
    print(url);
    var response = await http.get(url);
    return json.decode(response.body);
  }

  text() {
    return SkeletonAnimation(
      gradientColor: Color.fromARGB(0, 244, 244, 244),
      shimmerColor: Colors.white54,
      child: Text(''),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.amber),
          child: FutureBuilder<Map<String, dynamic>>(
            future: _fetchDataUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.data!['data']['nama_lengkap'],
                      style: textNama,
                    ),
                    Text(
                      snapshot.data!['data']['transports']['merk_transport'],
                      style: textMerk,
                    )
                  ],
                );
              } else {
                return Shimmer.fromColors(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        title: text(),
                        subtitle: text(),
                      )
                    ],
                  ),
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.white,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
