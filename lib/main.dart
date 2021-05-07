import 'package:flutter/material.dart';
import 'package:day3/screens/userdetails.dart';
import 'package:day3/screens/userspanel.dart';
import 'package:day3/screens/createuser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          buttonTheme: ButtonThemeData(buttonColor: Colors.cyan.shade500),
          primaryColor: Colors.cyan.shade500,
          scaffoldBackgroundColor: Colors.lightBlue.shade900,
          buttonColor: Colors.cyan.shade500,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.cyan.shade500,
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => UsersPanel(),
        '/details': (context) => UserDetails(),
        '/create': (context) => CreateUser(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
