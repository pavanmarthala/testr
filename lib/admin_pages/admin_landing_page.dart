// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_type_check, library_private_types_in_public_api, file_names, avoid_print, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:convert';
import 'package:eco/admin_pages/admin_homepage.dart';
import 'package:http/http.dart' as http;
import 'package:eco/admin_pages/add_user.dart';

// Import the AddTree page
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Adminlandingpage extends StatefulWidget {
  const Adminlandingpage({Key? key}) : super(key: key);

  @override
  _AdminlandingpageState createState() => _AdminlandingpageState();
}

class _AdminlandingpageState extends State<Adminlandingpage> {
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
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Token was not found. Please try again later.'),
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

        filterDevices('');
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
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              backgroundColor: Colors.teal,
              title: const Text(
                'Welcome To ECOHEX',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              actions: [],
            ),
            body: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.height * 0.5,
                      height: MediaQuery.of(context).size.height * 0.07,
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
                  Expanded(
                    child: ListView(
                      children: filteredDeviceList.map((device) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, right: 10),
                          child: Container(
                            height: 110,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.blue, Colors.teal],
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Adminhomepage(
                                      device["id"] ?? "",
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
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
                                                0.118,
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
                                                0.2,
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
                                                0.23,
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
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Adduser(),
                  ),
                );
              },
              elevation: 10,
              tooltip: 'Add Tree',
              label: const Text('Add User'),
              icon: Icon(Icons.person),
            ),
          );
        }
      },
    );
  }
}
