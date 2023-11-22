// ignore_for_file: avoid_print, use_build_context_synchronously, prefer_const_constructors

import 'dart:convert';
import 'package:eco/auth/forgot.dart';
import 'package:eco/auth/register.dart';
import 'package:eco/pages/Admin_HomePage.dart';
import 'package:eco/pages/User_HomePage.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
// import 'package:ecohex/auth/forgot.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingIN extends StatefulWidget {
  const SingIN({super.key});

  @override
  State<SingIN> createState() => _SingINState();
}

class _SingINState extends State<SingIN> {
  final formkey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();
  bool _obscureText = true; // Initially obscure text
  @override
  void initState() {
    super.initState();
    checkLoggedInStatus(); // Check the login status when the screen initializes
  }

  // Function to check the login status
  void checkLoggedInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    String? password = prefs.getString('password');

    if (username != null && password != null) {
      login(username, password);
    }
  }

  void login(String user, password) async {
    final Map<String, dynamic> requestData = {
      "password": password,
      "userId": user,
    };

    try {
      final response = await http.post(
        Uri.parse('https://api.ecohex.in/auth/login'),
        body: jsonEncode(requestData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);

        print('account login sucessfully');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', user);
        prefs.setString('password', password);
        prefs.setString('jwt_token', data['token']);

        // Decode the token to check user role
        final Map<String, dynamic> decodedToken =
            JwtDecoder.decode(data['token']);
        String userId = decodedToken['sub'];
        List<dynamic> authorities = decodedToken['authorities'];

        if (authorities.contains('superAdmin') ||
            (authorities.contains('Admin'))) {
          // Navigate to the admin panel (Adminlandingpage)
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => AdminHomePage(),
            ),
          );
        } else {
          // Navigate to the user panel (Landingpage)
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => UserHomePage(userId),
            ),
          );
        }
      } else {
        // Show a toast message for wrong credentials
        // Fluttertoast.showToast(
        //   msg: "Wrong credentials. Try again!",
        //   toastLength: Toast.LENGTH_SHORT,
        //   gravity: ToastGravity.BOTTOM,
        //   timeInSecForIosWeb: 3,
        //   backgroundColor: Colors.red,
        //   textColor: Colors.white,
        // );
        //Simple to use, no global configuration
        showToast(
          "Wrong credentials. Try again!",
          position: StyledToastPosition.bottom,
          context: context,
          animation: StyledToastAnimation.slideFromBottom,
          reverseAnimation: StyledToastAnimation.slideToBottom,
          duration: Duration(seconds: 4),
          animDuration: Duration(seconds: 1),
          curve: Curves.elasticOut,
          reverseCurve: Curves.linear,
          // backgroundColor: Colors.red,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        );

//Customize toast content widget, no global configuration
        // showToastWidget(Text('hello styled toast'), context: context);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 285, // Set the desired width
                          height: 80, // Set the desired height
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/EcoHex_Logo-removebg-preview.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "LogIn",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            // Set the text color to white
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _usernameController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: "Email/Mobile",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Mobile/Email is Required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                login(
                                  _usernameController.text.toString(),
                                  _passwordController.text.toString(),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 112, 112, 205),
                              fixedSize: const Size(650, 60),
                            ),
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                fontSize: 20,
                                color:
                                    Colors.white, // Set the text color to white
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ForgotPasswordPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => RegisterPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Register?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
