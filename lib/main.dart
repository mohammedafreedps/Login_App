import 'package:flutter/material.dart';
import 'package:login/homeScreen.dart';
import 'package:login/login_Screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isUserLoggedIn;

  @override
  void initState() {
    super.initState();
    checkIfUserIsLoggedIn();
  }

  Future<void> checkIfUserIsLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setBool('islogin', false);
    final bool? isLogin = prefs.getBool('islogin');
    

    setState(() {

      isUserLoggedIn = isLogin ?? false;
      print('main page : $isLogin');
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isUserLoggedIn == true ? const HomeScreen() : const LoginScreen(),
    );
  }
}