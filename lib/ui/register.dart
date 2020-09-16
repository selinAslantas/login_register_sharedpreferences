import 'package:flutter/material.dart';
import 'package:login_register/ui/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtSurname = TextEditingController();
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("Name", txtName.text);
    await prefs.setString("Surname", txtSurname.text);
    await prefs.setString("Username", txtUsername.text);
    await prefs.setString("Password", txtPassword.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "",
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: txtName,
                decoration: InputDecoration(hintText: "Adınızı Giriniz"),
              ),
            ),
            Text(""),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: txtSurname,
                decoration: InputDecoration(hintText: "Soyadınızı Giriniz"),
              ),
            ),
            Text(""),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: txtUsername,
                decoration:
                    InputDecoration(hintText: "Kullanıcı Adınızı Giriniz"),
              ),
            ),
            Text(""),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: txtPassword,
                decoration: InputDecoration(hintText: "Parolanızı Giriniz"),
              ),
            ),
            RaisedButton(
                child: Text(
                  "Kaydet",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () => saveData()),
          ],
        ),
      ),
    );
  }
}
