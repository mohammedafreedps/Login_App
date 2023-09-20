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
          title: Text('Home'),
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
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onLongPress: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Logout?'), 
                      content: Text(
                          'Do you really want to logout'), 
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop();
                          },
                          child: Text('NO'), 
                        ),
                        TextButton(
                          onPressed: () async {
                            final SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.setBool('islogin', false);
                            print('in homescreen');
                            print(prefs.getBool('islogin'));
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                                  (Route <dynamic> route) => false,
                            );
                            
                          },
                          child: Text('yes'), 
                        ),
                      
                      ],
                    );
                  },
                );
              },
              child: Text('log out'),
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 10),
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
                title: Text(arrNames[index]),
              );
            },
            itemCount: arrNames.length,
            separatorBuilder: (context, index) {
              return Divider(
                height: 100,
                thickness: 1,
              );
            },
            
          ),
        ));
  }
}
