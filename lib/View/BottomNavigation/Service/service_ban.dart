import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smart_service/services.dart';

class ServiceBan extends StatefulWidget {
  ServiceBan({Key? key}) : super(key: key);

  @override
  _ServiceBanState createState() => _ServiceBanState();
}

class _ServiceBanState extends State<ServiceBan> {
  List data = [];

  // Future<dynamic> getDataSemuaBan() async {
  //   var url = Uri.parse(SHOW_ALL_BAN);
  //   var response = await http.get(url);
  //   Map<String, dynamic> data = await jsonDecode(response.body);
  //   setState(() {
  //     data;
  //   });

  //   // print(data['data'][1]['merk_ban']);
  //   return "okmi";
  // }

  // @override
  // void initState() {
  //   this.getDataSemuaBan();
  // }

  // Future<List<Ban>>

  

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: Colors.red,
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            print(data);
            return Card(
              child: Text(data[index]["merk_ban"]),
            );
          }),
    );

    // return Scaffold(
    //   body: ListView.builder(
    //     itemCount: data == null ? 0 : data.length,
    //     itemBuilder: (BuildContext ctx, int index) {
    //       return new Card(
    //           shadowColor: null,
    //           color: Colors.black87,
    //           elevation: 5,
    //           child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 CircleAvatar(
    //                   radius: 50,
    //                   backgroundImage: AssetImage('asset/ban.png'),
    //                   backgroundColor: Colors.amber,
    //                 ),
    //                 Expanded(
    //                   child: Container(
    //                     color: Colors.amberAccent,
    //                     padding: EdgeInsets.all(5),
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                       children: [
    //                         Text(data[index]["merk_ban"]),
    //                         Text('2 Bulan'),
    //                       ],
    //                     ),
    //                   ),
    //                 )
    //               ]));
    //     },
    //   ),
    // );

    // return Scaffold(
    //   backgroundColor: Colors.amber.shade100,
    //   appBar: appBar,
    //   body: Column(
    //     children: [
    //       Container(
    //         padding: EdgeInsets.all(1),
    //         height: 140,
    //         child: ElevatedButton(
    //           style: ButtonStyle(
    //             backgroundColor:
    //                 MaterialStateProperty.all<Color>(Colors.transparent),
    //           ),
    //           onPressed: () {
    //             PressBan();
    //           },
    //           child: Card(
    //             shadowColor: null,
    //             color: Colors.black87,
    //             elevation: 5,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 CircleAvatar(
    //                   radius: 50,
    //                   backgroundImage: AssetImage('asset/ban.png'),
    //                   backgroundColor: Colors.amber,
    //                 ),
    //                 Expanded(
    //                   child: Container(
    //                     color: Colors.amberAccent,
    //                     padding: EdgeInsets.all(5),
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                       children: [
    //                         Text('GT Radial'),
    //                         Text('2 Bulan'),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //       ElevatedButton(
    //           onPressed: () {
    //             print(data);
    //           },
    //           child: SizedBox())
    //     ],
    //   ),
    // );
  }
}
