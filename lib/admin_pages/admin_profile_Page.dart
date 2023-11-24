// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:eco/auth/signin.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
// ! Note: this profile for admin

class Adminprofilepage extends StatefulWidget {
  @override
  State<Adminprofilepage> createState() => _AdminprofilepageState();
}

class _AdminprofilepageState extends State<Adminprofilepage> {
  final _advancedDrawerController = AdvancedDrawerController();
  late Future<Map<String, dynamic>> treeInfo;
  late Map<String, dynamic>? userData;
  @override
  void initState() {
    super.initState();
    treeInfo = fetchTreeInfo();
  }

  void logout() async {
    // Clear user login details from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    prefs.remove('password');
    prefs.remove('jwt_token');

    // Navigate to the sign-in page and replace the current route
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SingIN()),
    );
  }

  Future<Map<String, dynamic>> fetchTreeInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwtToken = prefs.getString('jwt_token');
    String? username = prefs.getString('username');

    if (jwtToken == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Token was not Fount . Please try again later.'),
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
    }
    try {
      final response = await http.get(
        Uri.parse('https://api.ecohex.in/user/get/$username'),
        headers: {
          "Authorization": "Bearer $jwtToken",
        },
      );

      if (response.statusCode == 200) {
        userData = json.decode(response.body);
        return userData!;
      } else {
        print(
            'API Response (Error): ${response.statusCode} - ${response.body}');
        throw Exception('Failed to load tree info');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load tree info');
    }
  }

  Widget listTile({required IconData icon, required String title}) {
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0.0,
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
          future: treeInfo,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              Map<String, dynamic> UserData = snapshot.data!;
              return Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        color: Colors.teal,
                      ),
                      const SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                      ),
                      Expanded(
                        child: Container(
                          // height: MediaQuery.of(context).size.height * 0.0,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.04,
                              vertical:
                                  MediaQuery.of(context).size.width * 0.08),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 253, 253),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              )),
                          child: ListView(
                            children: [
                              const SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.58,
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    // color: Colors.black,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              userData!['name'].toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.035,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            Text(
                                              UserData['email'].toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.035,
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                        // CircleAvatar(
                                        //   radius: 15,
                                        //   backgroundColor: Colors.lightBlue,
                                        //   child: CircleAvatar(
                                        //     radius: 12,
                                        //     child: Icon(Icons.edit,
                                        //         color: Colors.lightBlue),
                                        //     backgroundColor: Color(0xffcbcbcb),
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              // ListTile(
                              //   leading: const Icon(Icons.shop_outlined),
                              //   title: const Text("My Orders"),
                              //   onTap: () {},
                              //   trailing: const Icon(Icons.arrow_forward_ios),
                              // ),
                              ListTile(
                                leading: const Icon(Icons.location_on_outlined),
                                title: Text(
                                  "My Address",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      color: Colors.black),
                                ),
                                onTap: () {},
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size:
                                      MediaQuery.of(context).size.width * 0.055,
                                ),
                              ),
                              ListTile(
                                leading: const Icon(Icons.file_copy_outlined),
                                title: Text(
                                  "Terms & conditions",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      color: Colors.black),
                                ),
                                onTap: () {},
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size:
                                      MediaQuery.of(context).size.width * 0.055,
                                ),
                              ),
                              ListTile(
                                leading: const Icon(Icons.person_outlined),
                                title: Text(
                                  "Refer A friend",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      color: Colors.black),
                                ),
                                onTap: () {},
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size:
                                      MediaQuery.of(context).size.width * 0.055,
                                ),
                              ),
                              ListTile(
                                leading: const Icon(Icons.policy_outlined),
                                title: Text(
                                  "Privacy Policy",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      color: Colors.black),
                                ),
                                onTap: () {},
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size:
                                      MediaQuery.of(context).size.width * 0.055,
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.exit_to_app,
                                ),
                                title: Text(
                                  "Log Out",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      color: Colors.black),
                                ),
                                onTap: () {
                                  logout();
                                },
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size:
                                      MediaQuery.of(context).size.width * 0.055,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.23,
                        left: MediaQuery.of(context).size.width * 0.13),
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.135,
                      backgroundColor: Colors.teal,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/profile.webp"),
                        radius: MediaQuery.of(context).size.width * 0.12,
                        backgroundColor: Color.fromARGB(238, 255, 255, 255),
                        // child: Icon(Icons.),
                      ),
                    ),
                  )
                ],
              );
            }
          }),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
