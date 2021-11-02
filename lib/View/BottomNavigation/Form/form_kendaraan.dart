import 'package:flutter/material.dart';
import 'package:smart_service/View/BottomNavigation/bottom_navigation.dart';

class FormKendaraan extends StatefulWidget {
  FormKendaraan({Key? key}) : super(key: key);

  @override
  _FormKendaraanState createState() => _FormKendaraanState();
}

enum SingingCharacter { LD, HD }

class _FormKendaraanState extends State<FormKendaraan> {
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavigation()));
              },
              child: Text(
                'Pilih Kendaraan',
              ))
        ],
      ),
    );
  }
}
