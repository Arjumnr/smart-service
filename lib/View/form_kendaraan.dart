// import 'package:flutter/material.dart';

// class PilihKendaraan extends StatelessWidget {
//   const PilihKendaraan({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: MyStatefulWidget(),
//     );
//   }
// }

// enum SingingCharacter { LD, HD }

// class MyStatefulWidget extends StatefulWidget {
//   @override
//   _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   SingingCharacter? _character = SingingCharacter.LD;
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Row(
//         children: [
//           ListTile(
//             title: Text('Hino 110 LD'),
//             leading: Radio<SingingCharacter>(
//               value: SingingCharacter.LD,
//               groupValue: _character,
//               onChanged: (SingingCharacter? value) {
//                 setState(() {
//                   _character = value;
//                 });
//               },
//             ),
//           ),
//           ListTile(
//             title: Text('Hino 130 HD'),
//             leading: Radio<SingingCharacter>(
//               value: SingingCharacter.HD,
//               groupValue: _character,
//               onChanged: (SingingCharacter? value) {
//                 setState(() {
//                   _character = value;
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
