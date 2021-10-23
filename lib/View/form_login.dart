import 'package:flutter/material.dart';
import 'package:smart_service/View/form_kendaraan.dart';
import 'package:smart_service/View/form_register.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text('Username')),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                child: const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text('Password')),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                width: 200,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => FormKendaraan()));
                  },
                  child: const Text('Sign In'),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                width: 200,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.amberAccent),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const FormRegister()));
                  },
                  child: const Text('Sign Up'),
                ),
              )
            ],
          ),
        ));
  }
}
