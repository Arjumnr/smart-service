import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Colors.amber,
    //   body: Container(
    //       child: FutureBuilder<Map<String, dynamic>>(
    //           future: _fetchDataUser(),
    //           builder: (BuildContext context, AsyncSnapshot snapshot) {
    //             if (snapshot.hasData) {
    //               return ListView.builder(
    //                   itemCount: snapshot.data.length,
    //                   itemBuilder: (BuildContext context, int index) {
    //                     // print(snapshot.data['data']['nama_lengkap']);
    //                     return ListTile(
    //                         title: Text(snapshot.data['data']['nama_lengkap']));
    //                   });
    //             } else {
    //               return Center(child: CircularProgressIndicator());
    //             }
    //           })),
    // );

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
                      snapshot.data!['data']['no_hp'],
                      style: textMerk,
                    )
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );

    // return Scaffold(
    //   backgroundColor: Colors.amber.shade100,
    //   body: Container(
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(5), color: Colors.amber),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Column(
    //               children: [
    //                 Text(
    //                   'Muhammad Almuhaemin Ismail',
    //                   style: textNama,
    //                 ),
    //                 Text(
    //                   'Hino 110 LD',
    //                   style: textMerk,
    //                 ),
    //               ],
    //             )
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
