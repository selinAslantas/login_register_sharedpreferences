import 'package:flutter/material.dart';
import 'package:login_register/ui/home.dart';
import 'package:login_register/ui/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SharedPreferences prefs;

  Register username;
  Register password;

  TextEditingController txtUsername = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();
  bool validate = false;

  @override
  void dispose() {
    txtUsername.dispose();
    txtPassword.dispose();
    super.dispose();
  }

  onLoginButtonTapped() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      txtUsername.text.isEmpty ? validate = true : validate = false;
      txtPassword.text.isEmpty ? validate = true : validate = false;
    });
    if (txtUsername.text == prefs.getString("Username") &&
        txtUsername.text.isNotEmpty &&
        txtPassword.text.isNotEmpty &&
        txtPassword.text == prefs.getString("Password")) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Home()));
    }
    /*else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginPage()));
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                  hintText: "Parola Giriniz",
                  errorText: validate ? 'Hiç bir alan boş bırakılamaz' : null,
                ),
              ),
            ),
            RaisedButton(
                child: Text(
                  "Giriş Yap",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.black)),
                color: Colors.green[100],
                onPressed: () {
                  onLoginButtonTapped();
                }),
            RaisedButton(
                child: Text(
                  "Kayıt ol",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.black)),
                color: Colors.green[100],
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Register()))),
          ],
        ),
      ),
    );
  }
}
