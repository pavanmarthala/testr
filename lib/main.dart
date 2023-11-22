// ignore_for_file: prefer_const_constructors

import 'package:eco/auth/signin.dart';
import 'package:eco/auth/splash.dart';

import 'package:geolocator/geolocator.dart';

import 'package:flutter/material.dart';

void main() {
  GeolocatorPlatform.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoHex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        primarySwatch: Colors.lightBlue,
        useMaterial3: true,
      ),
      home: Splash(),
    );
  }
}
