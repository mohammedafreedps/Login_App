import 'package:flutter/material.dart';
import 'package:login/HomeScreen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController name = TextEditingController();
    final TextEditingController pass = TextEditingController();

    const TextStyle  googlefont2 = TextStyle(
      fontFamily: 'googlefont2',
    );

    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: name,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintStyle: googlefont2,
                ),
                style: googlefont2,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: pass,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintStyle: googlefont2,
                ),
                style: googlefont2,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // predifined vale to check
                if (name.text.trim() == 'afreed' &&
                    pass.text.trim() == '1234') {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('islogin', true);
                  print(prefs.getBool('islogin'));
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Login Failed'),
                        content: const Text('Incorrect username or password.'),
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
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
