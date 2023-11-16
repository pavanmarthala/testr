import 'dart:convert';
import 'package:eco/pages/info/Add_User.dart';
import 'package:http/http.dart' as http;

import 'package:eco/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
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
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // ignore: prefer_const_constructors
            title: Text('Error'),
            // ignore: prefer_const_constructors
            content: Text('Token was not Fount . Please try again later.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                // ignore: prefer_const_constructors
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
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                  automaticallyImplyLeading: false,
                  iconTheme: IconThemeData(
                      color: Colors.white), // Set back button color to white
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.teal, Colors.blue],
                      ),
                    ),
                  ), // Change the app bar color
                  title: const Text(
                    'Welcome To ECOHEX',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  actions: [
                    // IconButton(
                    //   onPressed: () {
                    //     Navigator.of(context).push(
                    //       MaterialPageRoute(
                    //         builder: (context) => SingIN(),
                    //       ),
                    //     );
                    //   },
                    //   icon: Icon(
                    //     Icons.exit_to_app,
                    //     size: 30,
                    //     color: Colors.white,
                    //   ),
                    // )
                  ]),
              body: Center(
                child: Column(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 40),
                    //   child:
                    //       Image.asset("assets/EcoHex_Logo-removebg-preview.png"),
                    // ),
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
                    Expanded(
                      child: ListView(
                        children: filteredDeviceList.map((device) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 10, right: 10),
                            child: Container(
                              // width: MediaQuery.of(context).size.height * 0.2,
                              height: 110,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Colors.blue, Colors.teal],
                                ),
                                borderRadius: BorderRadius.circular(15),
                                // border: Border.all(),
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
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    // Spacer(),
                  ],
                ),
              ),
            );
          }
        });
  }
}
