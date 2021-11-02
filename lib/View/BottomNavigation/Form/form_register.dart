import 'package:flutter/material.dart';

import 'form_login.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({Key? key}) : super(key: key);

  @override
  _FormRegisterState createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  bool _isObscure = true;
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
                      border: OutlineInputBorder(),
                      label: Text('Nama Lengkap')),
                ),
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
                child: TextField(
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
                child: const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text('Umur')),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                width: 200,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FormLogin()));
                  },
                  child: const Text('Sign In'),
                ),
              ),
            ],
          ),
        ));
  }
}
