import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_service/View/BottomNavigation/Form/form_kendaraan.dart';
import 'package:smart_service/View/BottomNavigation/Form/form_signup.dart';
import 'package:smart_service/View/BottomNavigation/bottom_navigation.dart';
import 'dart:convert';
import '../../../services.dart';

class FormSignIn extends StatefulWidget {
  Duration get FormSignInTime => const Duration(milliseconds: 1000);

  @override
  _FormSignInState createState() => _FormSignInState();
}

class _FormSignInState extends State<FormSignIn> {
  bool visible = false;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late ScaffoldMessengerState scaffoldMessenger;
  late String username, password;
  bool _isObscure = true;
  bool isLoading = false;
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);

    signIn(username, password) async {
      setState(() {
        isLoading = true;
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

        //SIMPAN DATA ID DI LOKAL
        var dataID = data['data']['id'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt('id', dataID);

        var dataKendaraan = data['data']['transports_id'];
        if (dataKendaraan == null) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext ctx) => PilihKendaraan()));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext ctx) => BottomNavigation()));
        }
      } else {
        Fluttertoast.showToast(
            msg: data['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);
      }
    }

    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.amber.shade50,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 60.0),
                width: 200,
                height: 200,
                child: Image.asset('asset/logoSS.png'),
              ),
              Center(
                child: Visibility(
                    visible: isLoading,
                    child: Container(child: CircularProgressIndicator())),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                child: TextFormField(
                  controller: _usernameController,
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
                    controller: _passwordController,
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
                padding: const EdgeInsets.only(top: 10),
                width: 200,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (_usernameController.text.isEmpty) {
                      scaffoldMessenger.showSnackBar(
                          SnackBar(content: Text('Isi Username')));
                      return;
                    } else if (_passwordController.text.isEmpty) {
                      scaffoldMessenger.showSnackBar(
                          SnackBar(content: Text('Isi Password')));
                      return;
                    }

                    signIn(_usernameController.text, _passwordController.text);
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext ctx) => FormSignUp()));
                  },
                  child: const Text('Sign Up'),
                ),
              ),
            ],
          ),
        ));
  }
}
