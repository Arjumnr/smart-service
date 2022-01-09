import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_service/View/BottomNavigation/Form/form_sigin.dart';
import 'dart:convert';
import 'package:smart_service/services.dart';

import '../bottom_navigation.dart';

class PilihKendaraan extends StatefulWidget {
  PilihKendaraan({Key? key}) : super(key: key);

  @override
  _PilihKendaraanState createState() => _PilihKendaraanState();
}

enum SingingCharacter { LD, HD }

class _PilihKendaraanState extends State<PilihKendaraan> {
  SingingCharacter? _character = SingingCharacter.LD;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,
        title: Center(child: Text('Pilih Jenis Kendaraan')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadioListTile(
              title: Text('Hino 110 LD'),
              value: SingingCharacter.LD,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              }),
          RadioListTile(
              title: Text('Hino 130 HD'),
              value: SingingCharacter.HD,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              }),
          ElevatedButton(
              onPressed: () {
                var kendaraan = _character.toString().split('.').last;
                if (kendaraan == 'LD') {
                  kendaraan = 'Hino 110 LD';
                } else {
                  kendaraan = 'Hino 130 HD';
                }
                print(kendaraan);
                btnPilihKendaraan(kendaraan);
              },
              child: Text(
                'Pilih Kendaraan',
              ))
        ],
      ),
    );
  }

  Future btnPilihKendaraan(kendaraan) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getInt('id').toString();
    Map mapData = {
      'merk_transport': kendaraan,
      'user_id': id,
    };

    http.Response response =
        await http.post(Uri.parse(PILIH_KENDARAAN), body: mapData);

    var data = jsonDecode(response.body);

    var dataKendaraan = data['data']['merk_kendaraan'];

    if (data['status'] == true) {
      Fluttertoast.showToast(
          msg: 'Kendaraan ' + kendaraan,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1);

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext ctx) => BottomNavigation()));
    } else {
      Fluttertoast.showToast(
          msg: 'Kendaraan Gagal Ditamabahkan',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1);
    }
  }
}
