import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../services.dart';

class FormSignIn extends StatefulWidget {
  const FormSignIn({Key? key}) : super(key: key);
  // ignore: non_constant_identifier_names
  Duration get FormSignInTime => const Duration(milliseconds: 1000);

  @override
  _FormSignInState createState() => _FormSignInState();
}

class _FormSignInState extends State<FormSignIn> {
  late ScaffoldMessengerState scaffoldMessenger;
  late String username, password;
  bool _isObscure = true;
  bool isLoading = false;
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber.shade50,
        body: Container(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    controller: usernameController,
                    onSaved: (val) {
                      username = val!;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_sharp),
                        border: OutlineInputBorder(),
                        label: Text('Username')),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                  child: TextFormField(
                      controller: passwordController,
                      onSaved: (val) {
                        password = val!;
                      },
                      obscureText: _isObscure,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outlined),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber)),
                        label: Text('Password'),
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
                  padding: const EdgeInsets.only(top: 10),
                  width: 200,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      if (isLoading) {
                        return;
                      }
                      if (usernameController.text.isEmpty) {
                        scaffoldMessenger.showSnackBar(
                            SnackBar(content: Text('Isi Username')));
                        return;
                      } else if (passwordController.text.isEmpty) {
                        scaffoldMessenger.showSnackBar(
                            SnackBar(content: Text('Isi Password')));
                        return;
                      } else {
                        signIn(
                            usernameController.text, passwordController.text);
                      }
                    },
                    child: const Text('Sign In'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  width: 200,
                  height: 60,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(primary: Colors.amberAccent),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signUp');
                    },
                    child: const Text('Sign Up'),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  signIn(username, password) async {
    setState(() {
      isLoading = false;
    });

    Map mapData = {
      'username': username,
      'password': password,
    };

    print(mapData.toString());

    http.Response response = await http.post(
      Uri.parse(SIGNIN),
      body: mapData,
    );
    var data = jsonDecode(response.body);

    print("DATA: ${data}");

    if (data['status'] == true) {
      Fluttertoast.showToast(
          msg: 'Login Berhasil',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1);
      Navigator.pushNamed(context, '/pilihKendaraan');
    } else {
      Fluttertoast.showToast(
          msg: 'Login Gagal',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1);
      // Navigator.pushNamed(context, '/signIn');
    }
  }

  // savePrev(int value, String username, int id) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setInt("value", value);
  //   preferences.setString("username", username);
  //   preferences.setString("id", id.toString());
  // }
}
