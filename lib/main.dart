import 'package:eco/auth/signin.dart';
import 'package:eco/pages/Admin_HomePage.dart';
import 'package:eco/pages/homepage.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        // '/splash': (cotext) => SplashScreen(),
        '/user_landing': (context) => AdminHomePage(),
        '/homepage': (context) => Homepage('9700930088'),
        // '/settings': (context) => Settings(),
        '/signin': (context) => SingIN(),
        // '/adminlandingpage': (context) => Adminlandingpage(),
        // '/landingpage': (context) => Landingpage(
        //       id: '',
        //     ),
      },
      initialRoute: '/signin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        primarySwatch: Colors.lightBlue,
        useMaterial3: true,
      ),
      home: SingIN(),
    );
  }
}
