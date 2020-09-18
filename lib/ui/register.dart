import 'package:flutter/material.dart';
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
  bool validate = false;

  saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
                        setState(() {
                    txtUsername.text.isEmpty
                        ? validate = true
                        : validate = false;
                    txtPassword.text.isEmpty
                        ? validate = true
                        : validate = false;
                    txtName.text.isEmpty ? validate = true : validate = false;
                    txtSurname.text.isEmpty
                        ? validate = true
                        : validate = false;
                  });
                  if(txtName.text.isNotEmpty &&
        txtPassword.text.isNotEmpty &&
        txtSurname.text.isNotEmpty &&
        txtUsername.text.isNotEmpty){
    await prefs.setString("Name", txtName.text);
    await prefs.setString("Surname", txtSurname.text);
    await prefs.setString("Username", txtUsername.text);
    await prefs.setString("Password", txtPassword.text);
        Navigator.pop(context);
        }
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
                decoration: InputDecoration(
                  hintText: "Adınızı Giriniz",
                  errorText: validate ? 'Hiç bir alan boş bırakılamaz' : null,
                ),
              ),
            ),
            Text(""),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: txtSurname,
                decoration: InputDecoration(
                  hintText: "Soyadınızı Giriniz",
                  errorText: validate ? 'Hiç bir alan boş bırakılamaz' : null,
                ),
              ),
            ),
            Text(""),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: txtUsername,
                decoration: InputDecoration(
                  hintText: "Kullanıcı Adınızı Giriniz",
                  errorText: validate ? 'Hiç bir alan boş bırakılamaz' : null,
                ),
              ),
            ),
            Text(""),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: txtPassword,
                decoration: InputDecoration(
                  hintText: "Parolanızı Giriniz",
                  errorText: validate ? 'Hiç bir alan boş bırakılamaz' : null,
                ),
              ),
            ),
            RaisedButton(
                child: Text(
                  "Kaydet",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {

                  saveData();

                }),
          ],
        ),
      ),
    );
  }
}
