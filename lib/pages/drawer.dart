// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, use_build_context_synchronously

import 'dart:convert';
import 'package:eco/pages/info/Add_User.dart';
import 'package:http/http.dart' as http;

import 'package:eco/pages/homepage.dart';
import 'package:flutter/material.dart';
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
            return Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child:
                        Image.asset("assets/EcoHex_Logo-removebg-preview.png"),
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
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 0),
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
                          padding: const EdgeInsets.only(left: 10, top: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.height * 0.5,
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
                                          width: 53,
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
                                          width: 63,
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
                        height: MediaQuery.of(context).size.height * 0.07,
                        // width: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.height * 0.1,
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
        });
  }
}
