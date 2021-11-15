import 'package:flutter/material.dart';
import 'dart:async' as http;

import 'form_kendaraan.dart';
import 'form_register.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);
  // ignore: non_constant_identifier_names
  Duration get FormLoginTime => const Duration(milliseconds: 1000);

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
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
                      }

                      signIn(usernameController, passwordController);
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FormRegister()));
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
      isLoading = true;
    });

    print('signin');

    Map data = {
      'username': username,
      'password': password,
    };
    print(data.toString());

    // final response = await http.ge
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FormKendaraan()));
  }
}
