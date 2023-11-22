// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, use_build_context_synchronously, unnecessary_type_check, library_private_types_in_public_api, avoid_print, sized_box_for_whitespace

import 'dart:convert';
import 'package:eco/auth/signin.dart';
import 'package:eco/pages/User_HomePage.dart';
import 'package:eco/pages/info/Add_User.dart';
import 'package:eco/pages/info/assestinfo/user_profile.dart';
import 'package:http/http.dart' as http;

import 'package:eco/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mydrawer extends StatefulWidget {
  const Mydrawer({Key? key}) : super(key: key);

  @override
  _MydrawerState createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  List<Map<String, String>> deviceList = [];
  List<Map<String, String>> filteredDeviceList = [];

  Future<List<Map<String, String>>>? devices;

  @override
  void initState() {
    super.initState();
    devices = fetchUsers();
  }

  Map<String, dynamic> decodeJwt(String token) {
    try {
      return JwtDecoder.decode(token);
    } catch (e) {
      print('Error decoding JWT: $e');
      return {};
    }
  }

  void home() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => Homepage(username!)),
    );
  }

  void logout() async {
    // Clear user login details from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    prefs.remove('password');
    prefs.remove('jwt_token');

    // Navigate back to the login page
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => SingIN()),
    );
  }

  Future<bool> checkUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwtToken = prefs.getString('jwt_token');

    if (jwtToken != null) {
      Map<String, dynamic> decodedToken = decodeJwt(jwtToken);
      List<dynamic> authorities = decodedToken['authorities'];

      return authorities.contains('Admin') ||
          authorities.contains('superAdmin');
    }

    return false;
  }

  Future<List<Map<String, String>>> fetchUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwtToken = prefs.getString('jwt_token');

    if (jwtToken == null) {
      // Handle the case where the token is not found
      // return null;

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
    final response = await http.get(
      Uri.https('api.ecohex.in', '/user/getUserIds'),
      headers: {
        "Authorization": "Bearer $jwtToken",
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);

      if (jsonResponse is List) {
        deviceList = jsonResponse.map((device) {
          return {
            "id": device["id"].toString(),
            "name": device['name'].toString(),
            "role": device["role"].toString(),
          };
        }).toList();

        filterDevices(''); // Initialize with an empty query
        return deviceList;
      } else {
        return <Map<String, String>>[];
      }
    } else {
      print('API Response (Error): ${response.body}');
      throw Exception('Failed to load devices');
    }
  }

  void filterDevices(String query) {
    setState(() {
      filteredDeviceList = deviceList
          .where((device) =>
              // (device["name"] ?? "")
              //     .toLowerCase()
              //     .contains(query.toLowerCase()) ||
              (device["id"] ?? "").toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, String>>>(
        future: devices,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return FutureBuilder<bool>(
              future: checkUserRole(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data == true) {
                    return Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Image.asset(
                                "assets/EcoHex_Logo-removebg-preview.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.height * 0.5,
                              height: MediaQuery.of(context).size.height * 0.07,
                              // color: Colors.black,
                              child: TextField(
                                onChanged: (value) {
                                  filterDevices(value);
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 0),
                                  hintText: 'Search for Users',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(),
                                  ),
                                  fillColor: Colors.white54,
                                  filled: true,
                                  suffixIcon: const Icon(Icons.search),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // color: Colors.black,
                            height: MediaQuery.of(context).size.height * 0.66,
                            child: ListView(
                              children: filteredDeviceList.map((device) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 20),
                                  child: Container(
                                    width: MediaQuery.of(context).size.height *
                                        0.5,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => Homepage(
                                              device["id"] ?? "",
                                            ),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              children: [
                                                const Text('ID'),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.1,
                                                ),
                                                Text(
                                                  device["id"] ?? "",
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              children: [
                                                const Text('Name'),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.14,
                                                ),
                                                Text(
                                                  device["name"] ?? "user",
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              children: [
                                                const Text('Role'),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.17,
                                                ),
                                                Text(
                                                  device["role"] ?? "",
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          // Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Adduser(),
                                  ),
                                );
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                // width: MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                    color: Colors.white38,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                    ),
                                    Icon(Icons.person_add),
                                    Text('  Add User'),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                }
                return Center(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Image.asset(
                          "assets/EcoHex_Logo-removebg-preview.png",
                          // scale: 5,
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 35,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 7,
                              ),
                              Container(
                                height: 30,
                                child: outlineButton(
                                  onPressed: () {},
                                  child: const Text("login"),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: const BorderSide(width: 2)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ListTile(
                        leading: const Icon(Icons.home_outlined),
                        title: const Text("Home"),
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          String? username = prefs.getString('username');
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => UserHomePage(username!)),
                          );
                        },
                      ),
                      // ListTile(
                      //   leading: const Icon(Icons.shop_outlined),
                      //   title: const Text("Review Cart"),
                      //   onTap: () {
                      //     //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Review(),),);
                      //   },
                      // ),
                      ListTile(
                        leading: const Icon(Icons.person_outlined),
                        title: const Text("My Profile"),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Myprofile(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.notifications_outlined),
                        title: const Text("Notification"),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.star_outlined),
                        title: const Text("Rating"),
                        onTap: () {},
                      ),
                      // ListTile(
                      //   leading: const Icon(Icons.favorite_outlined),
                      //   title: const Text("Wishlist"),
                      //   onTap: () {},
                      // ),
                      // ListTile(
                      //   leading: const Icon(Icons.copy_outlined),
                      //   title: const Text("Raise a Complaint"),
                      //   onTap: () {},
                      // ),
                      ListTile(
                        leading: const Icon(Icons.exit_to_app_outlined),
                        title: const Text("Log out"),
                        onTap: () {
                          logout();
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.22,
                      ),

                      Container(
                        height: 350,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("contact support"),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text("call us:"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("123456789"),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Text("Mail us:"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Support@gmail.com"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ); // Return an empty container if not admin or superadmin
              },
            );
          }
        });
  }

  outlineButton(
      {required Null Function() onPressed,
      required Text child,
      required RoundedRectangleBorder shape}) {}
}
