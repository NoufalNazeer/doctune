import 'package:doctune/pages/home_page.dart';
import 'package:doctune/pages/login_page.dart';
import 'package:doctune/pages/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: <String,WidgetBuilder>{
        '/login':(BuildContext context) => new Login(),
        '/signup':(BuildContext context) => new Signupuser(),
        '/home':(BuildContext context) => new Homepage(),

      }

    );
  }
}
