import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var name;
  getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = await prefs.getString("$key");
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    getData("Name");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hoşgeldiniz $name"),
      ),
    );
  }
}
