import 'package:flutter/material.dart';

class HomeStatusService extends StatefulWidget {
  const HomeStatusService({Key? key}) : super(key: key);

  @override
  State<HomeStatusService> createState() => _HomeStatusServiceState();
}

class _HomeStatusServiceState extends State<HomeStatusService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber.shade100,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.amber.shade200,
          ),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber.shade400),
                child: ListTile(
                  title: Text(
                    'Layak',
                  ),
                  leading: CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage('asset/ban.png'),
                    backgroundColor: Colors.amber.shade50,
                  ),
                  trailing: Text('Ban'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber.shade400),
                child: ListTile(
                  title: Text(
                    'Kurang Layak',
                  ),
                  leading: CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage('asset/oli.png'),
                    backgroundColor: Colors.amber.shade50,
                  ),
                  trailing: Text('Oli'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber.shade400),
                child: ListTile(
                  title: Text(
                    'Belum Service',
                  ),
                  leading: CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage('asset/rem.png'),
                    backgroundColor: Colors.amber.shade50,
                  ),
                  trailing: Text('Rem'),
                ),
              ),
            ],
          ),
        ));
  }
}
// background,
      // body: Container(
      //   // margin: EdgeInsets.fromLTRB(30, 30, 30, 30),
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(20),
      //     color: Colors.amber.shade200,
      //   ),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Container(
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Container(
      //               width: 100,
      //               height: 100,
      //               child: Card(
      //                 color: Colors.yellow,
      //                 child: Image.asset('asset/ban.png'),
      //               ),
      //             ),
      //             Container(
      //               margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      //               width: MediaQuery.of(context).size.width,
      //               height: 100,
      //               child: Card(
      //                 child: Center(
      //                     child: Text(
      //                   'Layak',
      //                   style: TextStyle(fontSize: 20),
      //                 )),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       Container(
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Container(
      //               width: 100,
      //               height: 100,
      //               child: Card(
      //                 color: Colors.yellow,
      //                 child: Image.asset('asset/oli.png'),
      //               ),
      //             ),
      //             Container(
      //               margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      //               width: MediaQuery.of(context).size.width,
      //               height: 100,
      //               child: Card(
      //                 child: Center(
      //                     child: Text(
      //                   'Tidak Layak',
      //                   style: TextStyle(fontSize: 20),
      //                 )),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       Container(
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Container(
      //               width: 100,
      //               height: 100,
      //               child: Card(
      //                 color: Colors.yellow,
      //                 child: Image.asset('asset/rem.png'),
      //               ),
      //             ),
      //             Container(
      //               margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      //               width: MediaQuery.of(context).size.width,
      //               height: 100,
      //               child: Card(
      //                 child: Center(
      //                     child: Text(
      //                   'Belum Servis',
      //                   style: TextStyle(fontSize: 20),
      //                 )),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
