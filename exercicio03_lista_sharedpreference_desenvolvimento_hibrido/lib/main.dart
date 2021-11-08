import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String _theme = "Light";
  var _themeData = ThemeData.light();

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _theme = (prefs.getString("theme") ?? "Light");
      _themeData = _theme == "Dark" ? ThemeData.dark() : ThemeData.light();
    });
  }

  _setTheme(theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _theme = theme;
      _themeData = theme == "Dark" ? ThemeData.dark() : ThemeData.light();
      prefs.setString("theme", theme);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: _themeData,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text("SharedPreferences"), centerTitle: true),
          body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(fixedSize: Size(200, 50)),
                      onPressed: () {
                        _setTheme("Light");
                      },
                      child: Text("Claro"))),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(fixedSize: Size(200, 50)),
                      onPressed: () {
                        _setTheme("Dark");
                      },
                      child: Text("Escuro")))
            ])
          ]),
        ));
  }
}
