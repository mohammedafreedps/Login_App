import 'package:flutter/material.dart';
import 'package:login/HomeScreen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController name = TextEditingController();
    final TextEditingController pass = TextEditingController();

    const TextStyle googlefont2 = TextStyle(
      fontFamily: 'googlefont2',
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: const Color.fromARGB(136, 161, 150, 150),
            child:
             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 400,
                  color: const Color.fromARGB(255, 51, 51, 51),
                  child:FractionallySizedBox(
                    widthFactor: 0.4,
                    child: Opacity(
                      opacity: 0.6,
                      child: Image.asset('assets/Images/logo.png',
                      
                      // width: 10,
                      ),
                    ),
                  ) 
                ),
                const SizedBox(
                  height:  90,
                ),
                const Text(
                  'Log In',
                  style: TextStyle(
                      fontSize: 45,
                      fontFamily: 'googlefont2',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 49, 49, 49)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: TextField(
                    controller: name,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.black54),
                      hintStyle: googlefont2,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54)
                      )
                    ),
                    cursorColor: Colors.black54,
                    style: googlefont2,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 60, right: 60, top: 70),
                  child: TextField(
                    controller: pass,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black54),
                      hintStyle: googlefont2,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54)
                      )
                    ),
                    cursorColor: Colors.black54,
                    style: googlefont2,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 70,bottom: 166),
                    width: 300,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () async {
                        // predifined vale to check
                        if (name.text.trim() == 'afreed' &&
                            pass.text.trim() == '1234') {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setBool('islogin', true);
                          // print(prefs.getBool('islogin'));
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Login Failed'),
                                content:
                                    const Text('Incorrect username or password.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey, 
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      
                    ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
