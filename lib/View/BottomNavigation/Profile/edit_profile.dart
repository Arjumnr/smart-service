import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import 'package:skeleton_text/skeleton_text.dart';
import '../../../services.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

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

late String namaLengkap, username, password, noHp;
bool _isObscure = true;
bool isLoading = false;

TextEditingController _namaLengkapController = new TextEditingController();
TextEditingController _usernameController = new TextEditingController();
TextEditingController _passwordController = new TextEditingController();
TextEditingController _noHpController = new TextEditingController();

late ScaffoldMessengerState scaffoldMessenger;

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    //
    scaffoldMessenger = ScaffoldMessenger.of(context);
    final appBar = AppBar(
      backgroundColor: Colors.amber,
      leading: BackButton(
        color: Colors.black,
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Center(
        child: Text('Edit Profile'),
      ),
    );
    //
    //

    //UPDATE USER
    updateUser() async {
      setState(() {
        Map mapData = {};
      });
    }

    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: FutureBuilder<Map<String, dynamic>>(
            future: _fetchDataUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //
                return Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 20, left: 50, right: 50),
                      child: TextFormField(
                        controller: _namaLengkapController,
                        onSaved: (val) {
                          namaLengkap = val!;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label:
                                Text(snapshot.data!['data']['nama_lengkap'])),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 20, left: 50, right: 50),
                      child: TextFormField(
                        controller: _usernameController,
                        onSaved: (val) {
                          username = val!;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(snapshot.data!['data']['username'])),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 20, left: 50, right: 50),
                      child: TextFormField(
                          controller: _passwordController,
                          onSaved: (val) {
                            password = val!;
                          },
                          obscureText: _isObscure,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('******'),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          )),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 20, left: 50, right: 50),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _noHpController,
                        onSaved: (val) {
                          noHp = val!;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text(snapshot.data!['data']['no_hp']),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      width: 200,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          // if (isLoading) {
                          //   return;
                          // }
                          // if (_namaLengkapController.text.isEmpty) {
                          //   scaffoldMessenger.showSnackBar(
                          //       SnackBar(content: Text('Isi Nama Lengkap')));
                          //   return;
                          // } else if (_usernameController.text.isEmpty) {
                          //   scaffoldMessenger.showSnackBar(
                          //       SnackBar(content: Text('Isi Username')));
                          //   return;
                          // } else if (_passwordController.text.isEmpty) {
                          //   scaffoldMessenger.showSnackBar(
                          //       SnackBar(content: Text('Isi Password')));
                          //   return;
                          // } else if (_noHpController.text.isEmpty) {
                          //   scaffoldMessenger.showSnackBar(
                          //       SnackBar(content: Text('Isi No Hp')));
                          //   return;
                          // }

                          // updateUser(
                          //     _namaLengkapController.text,
                          //     _usernameController.text,
                          //     _passwordController.text,
                          //     _noHpController.text);
                        },
                        child: const Text('Simpan'),
                      ),
                    ),
                  ],
                );
              } else {
                return Shimmer.fromColors(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 20, left: 50, right: 50),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: text(),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 20, left: 50, right: 50),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: text(),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 20, left: 50, right: 50),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: text(),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 20, left: 50, right: 50),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: text(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.white,
                );
              }
            },
          ),
        ));
  }
}
