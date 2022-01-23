import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smart_service/services.dart';

class ServiceBan extends StatefulWidget {
  ServiceBan({Key? key}) : super(key: key);

  @override
  _ServiceBanState createState() => _ServiceBanState();
}

Future<dynamic> getDataSemuaBan() async {
  var url = Uri.parse(SHOW_ALL_BAN);
  var response = await http.get(url);

  return jsonDecode(response.body);
}

List data = [getDataSemuaBan()];

class _ServiceBanState extends State<ServiceBan> {
  @override
  Widget build(BuildContext context) {
    print(data);
    final appBar = AppBar(
      backgroundColor: Colors.amber,
      automaticallyImplyLeading: false,
      title: Center(child: Text('Pilih Ban')),
    );

    PressBan() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Text('sndsndnsndnskdksnd'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('data'),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: appBar,
      body: Container(
        padding: EdgeInsets.all(1),
        height: 140,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
          ),
          onPressed: () {
            PressBan();
          },
          child: Card(
            shadowColor: null,
            color: Colors.black87,
            elevation: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('asset/ban.png'),
                  backgroundColor: Colors.amber,
                ),
                Expanded(
                  child: Container(
                    color: Colors.amberAccent,
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('GT Radial'),
                        Text('2 Bulan'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
