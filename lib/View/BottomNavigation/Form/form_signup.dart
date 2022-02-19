import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../../services.dart';
import 'form_sigin.dart';

class FormSignUp extends StatefulWidget {
  const FormSignUp({Key? key}) : super(key: key);

  @override
  _FormSignUpState createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late ScaffoldMessengerState scaffoldMessenger;
  late String namaLengkap, username, password, noHp;
  bool _isObscure = true;
  bool isLoading = false;

  TextEditingController _namaLengkapController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _noHpController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    final appBar = AppBar(
      backgroundColor: Colors.amber,
      automaticallyImplyLeading: false,
      title: Center(child: Text('Sign Up')),
    );

    Future signUp(namaLengkap, username, password, noHp) async {
      setState(() {
        isLoading = true;
      });

      print('calling');

      Map mapData = {
        'nama_lengkap': namaLengkap,
        'username': username,
        'password': password,
        'no_hp': noHp
      };

      print(mapData.toString());

      http.Response response = await http.post(
        Uri.parse(SIGNUP),
        body: mapData,
      );
      var data = jsonDecode(response.body);

      print("DATA: ${data}");

      if (data['status'] == true) {
        Fluttertoast.showToast(
            msg: 'Register Berhasil',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext ctx) => FormSignIn()));
      } else {
        Fluttertoast.showToast(
            msg: data['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);
      }
    }

    //
    return Scaffold(
        appBar: appBar,
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        backgroundColor: Colors.amber.shade50,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 60.0),
                width: 200,
                height: 200,
                child: Image.asset('asset/logoSS.png'),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                child: TextFormField(
                  controller: _namaLengkapController,
                  onSaved: (val) {
                    namaLengkap = val!;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Nama Lengkap'),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                child: TextFormField(
                  controller: _usernameController,
                  onSaved: (val) {
                    username = val!;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Username'),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                child: TextFormField(
                    controller: _passwordController,
                    onSaved: (val) {
                      password = val!;
                    },
                    obscureText: _isObscure,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Password'),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
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
                padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _noHpController,
                  onSaved: (val) {
                    noHp = val!;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('No Hp'),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                width: 200,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (isLoading) {
                      return;
                    }
                    if (_namaLengkapController.text.isEmpty) {
                      scaffoldMessenger.showSnackBar(
                          SnackBar(content: Text('Isi Nama Lengkap')));
                      return;
                    } else if (_usernameController.text.isEmpty) {
                      scaffoldMessenger.showSnackBar(
                          SnackBar(content: Text('Isi Username')));
                      return;
                    } else if (_passwordController.text.isEmpty) {
                      scaffoldMessenger.showSnackBar(
                          SnackBar(content: Text('Isi Password')));
                      return;
                    } else if (_noHpController.text.isEmpty) {
                      scaffoldMessenger
                          .showSnackBar(SnackBar(content: Text('Isi No Hp')));
                      return;
                    }

                    signUp(
                        _namaLengkapController.text,
                        _usernameController.text,
                        _passwordController.text,
                        _noHpController.text);
                  },
                  child: const Text('Sign Up'),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                width: 200,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.amberAccent),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext ctx) => FormSignIn()));
                  },
                  child: const Text('Sign In'),
                ),
              ),
            ],
          ),
        ));
  }
}
