import 'package:flutter/material.dart';

import 'form_kendaraan.dart';
import 'form_register.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);
  // ignore: non_constant_identifier_names
  Duration get FormLoginTime => const Duration(milliseconds: 1000);

  @override
  _FormLoginState createState() => _FormLoginState();

  // Future<String> _authUser(FormLoginData data) {
  //   print('Name: ${data.name}, Password: ${data.password}');
  //   return Future.delayed(FormLoginTime).then((_) {
  //     if (!users.containsKey(data.name)) {
  //       return 'User not exists';
  //     }
  //     if (users[data.name] != data.password) {
  //       return 'Password does not match';
  //     }
  //     return null;
  //   });
  // }
}

class _FormLoginState extends State<FormLogin> {
  bool _isObscure = true;
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
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_sharp),
                        border: OutlineInputBorder(),
                        label: Text('Username')),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                  child: TextFormField(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormKendaraan()));
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
}
