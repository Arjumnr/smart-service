import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'form_login.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({Key? key}) : super(key: key);

  @override
  _FormRegisterState createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  late String namaLengkap, username, password, noHp;
  bool _isObscure = true;
  bool isLoading = false;
  late ScaffoldMessengerState scaffoldMessenger;

  TextEditingController _namaLengkapController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _noHpController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
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
                      label: Text('Nama Lengkap')),
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
                      border: OutlineInputBorder(), label: Text('Username')),
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
                  controller: _noHpController,
                  onSaved: (val) {
                    noHp = val!;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text('No Hp')),
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
              // Container(
              //   padding: const EdgeInsets.only(top: 10),
              //   width: 200,
              //   height: 60,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(primary: Colors.amberAccent),
              //     onPressed: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const FormLogin()));
              //     },
              //     child: const Text('Sign In'),
              //   ),
              // ),
            ],
          ),
        ));
  }

  signUp(namaLengkap, username, password, noHp) async {
    setState(() {
      isLoading = true;
    });

    print('calling');

    Map data = {
      'nama_lengkap': namaLengkap,
      'username': username,
      'password': password,
      'no_hp': noHp
    };

    print(data.toString());

    final response =
        await http.post(Uri.parse('http://127.0.0.1:8000/api/register'),
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/x-www-form-urlencoded"
            },
            body: data,
            encoding: Encoding.getByName("utf-8"));

    if (response.statusCode == true) {
      setState(() {
        isLoading = false;
      });
      Map<String, dynamic> res = jsonDecode(response.body);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => FormLogin()));
      if (!res['false']) {
        Map<String, dynamic> users = res['data'];
      }
    }
  }
}
