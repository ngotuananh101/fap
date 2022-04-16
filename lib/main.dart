import 'package:fap/ui/intro.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:fap/ui/login.dart';
import 'package:fap/ui/home.dart';

void main() {
  runApp(
    const MainApp()
  );
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends  State<MainApp> {

  bool isFirstRun = false;
  bool isLogin = false;

  _MainAppState() {
    IsFirstRun.isFirstRun().then((value) {
      setState(() {
        isFirstRun = value;
      });
    });
    isLoggedIn().then((value) {
      setState(() {
        isLogin = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Work Sans',),
      // home: isFirstRun ? const Intro() : ( isLogin ? HomePage() : LoginPage() ),
      home: Intro(),
    );
  }
}

Future<bool> isLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}