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
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber.shade400),
              child: ListTile(
                title: Text(
                  'Layak',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('asset/ban.png'),
                  backgroundColor: Colors.amber.shade50,
                ),
                trailing: Text('Ban GT Radial'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber.shade400),
              child: ListTile(
                title: Text('Belum Servis',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
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
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber.shade400),
              child: ListTile(
                title: Text('Belum Servis',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                leading: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('asset/rem.png'),
                  backgroundColor: Colors.amber.shade50,
                ),
                trailing: Text('Rem'),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
