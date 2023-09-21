import 'package:flutter/material.dart';
import 'package:login/login_Screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List arrNames = [
  'John Smith',
  'Jane Doe',
  'Michael Johnson',
  'Emily Davis',
  'Robert Wilson',
  'Sarah Martinez',
  'William Brown',
  'Olivia Taylor',
  'James Lee',
  'Emma Anderson',
  'David Harris',
  'Sophia Garcia',
  'Daniel Rodriguez',
  'Ava Jackson',
  'Joseph Thomas',
  'Mia White',
  'Christopher Lewis',
  'Isabella Hall',
  'Matthew Turner',
  'Grace Moore',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 102, 102, 102),
          title: const Text('Home', style: TextStyle(
            fontFamily: 'googlefont',
            fontSize: 30
          ),),
          
          centerTitle: true,
          leading: Container(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('To Perform Logout'),
                      content: const Text('You need to longPress to logout'),
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
              },
              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 228, 135, 128)),
              onLongPress: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Logout?'), 
                      content: const Text(
                          'Do you really want to logout'), 
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop();
                          },
                          child: const Text('NO'), 
                        ),
                        TextButton(
                          onPressed: () async {
                            final SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.setBool('islogin', false);
                            // print('in homescreen');
                            // print(prefs.getBool('islogin'));
                            Navigator.pushAndRemoveUntil(context,MaterialPageRoute (
                                  builder: (context) => const LoginScreen()),
                                  (Route <dynamic> route) => false,
                            );
                            
                          },
                          child: const Text('yes'), 
                        ),
                      
                      ],
                    );
                  },
                );
              },
              child: const Text('log out'),
            ),
          ),
        ),
        body: Container(
          color: const Color.fromARGB(255, 71, 71, 71),
          child: ListView.separated(
            itemBuilder: (context, index) {
              final isEven = index.isEven;
              final borderRadious = isEven ? BorderRadius.circular(25) : BorderRadius.zero; 
              
              return ListTile(
                leading: ClipRRect(
                  borderRadius: borderRadious,
                  child: Image.asset(
                    'assets/Images/picfor.jpg',
                    width: 60,
                    height: 60,
                    
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(arrNames[index],
                style: const TextStyle(
                  fontFamily: 'googlefont2',
                  color: Color.fromARGB(255, 226, 226, 226),
                  fontWeight: FontWeight.bold
                ),),
              );
            },
            itemCount: arrNames.length,
            separatorBuilder: (context, index) {
              return const Divider(
                height: 100,
                thickness: 1,
              );
            },
            
          ),
        ));
  }
}
