import 'dart:convert';

//import 'package:flutter/cupertino.dart';
import 'package:eco/auth/signin.dart';
import 'package:eco/user_pages/user_homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin_pages/admin_landing_page.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  // Define the decodeToken method to decode the JWT token
  Map<String, dynamic> decodeToken(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token');
    }
    final payload = parts[1];
    final String normalized = base64Url.normalize(payload);
    final String resp = utf8.decode(base64Url.decode(normalized));
    final Map<String, dynamic> map = json.decode(resp);
    return map;
  }

  @override
  void initState() {
    super.initState();

    _navigateToPage();
  }

  void _navigateToPage() async {
    // Simulate checking the user's login status.
    await Future.delayed(Duration(seconds: 2));

    // Fetch the stored JWT token
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwtToken = prefs.getString('jwt_token');
    String? userId = prefs.getString('username');
    print('JWT Token: $jwtToken');
    print('User ID: $userId');
    if (jwtToken == null) {
      // If the token is not found, go to the login page.
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SigninPage()));
    } else {
      // Decode the JWT token
      Map<String, dynamic> decodedToken = decodeToken(jwtToken);

      // Check user role
      List<dynamic> authorities = decodedToken['authorities'];
      if (authorities.contains('Admin') || authorities.contains('superAdmin')) {
        // User is a superadmin, navigate to AdminLandingPage.
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Adminlandingpage(),
          ),
        );
      } else {
        // User is not a superadmin, navigate to the user landing page.
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => UserHomepage(userId!),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/EcoHex_Logo-removebg-preview.png'),
      ),
    );
  }
}
