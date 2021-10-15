import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  Duration get loginScreenTime => Duration(milliseconds: 1000);

  @override
  _LoginScreenState createState() => _LoginScreenState();

  // Future<String> _authUser(LoginScreenData data) {
  //   print('Name: ${data.name}, Password: ${data.password}');
  //   return Future.delayed(loginScreenTime).then((_) {
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

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber.shade50,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 60.0),
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
                    //         builder: (context) => PilihKendaraan()));
                  },
                  child: const Text('Login'),
                ),
              )
            ],
          ),
        ));
  }
}
