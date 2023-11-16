// ignore_for_file: prefer_const_constructors, duplicate_ignore, use_build_context_synchronously, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, library_private_types_in_public_api

import 'package:eco/pages/homepage.dart';
import 'package:eco/pages/info/Add_Tree.dart';
import 'package:eco/pages/info/assestinfo/Tree_Info.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TreeLandinpPage extends StatefulWidget {
  final String userid;
  TreeLandinpPage(this.userid, {super.key});

  @override
  _TreeLandinpPageState createState() => _TreeLandinpPageState();
}

class _TreeLandinpPageState extends State<TreeLandinpPage> {
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
      Uri.https('api.ecohex.in', '/tree/getTreeId/${widget.userid}'),
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
            "kathaNumber": device['kathaNumber'].toString(),
            "surveyNumber": device["surveyNumber"].toString(),
            "numberOfTrees": device["numberOfTrees"].toString(),
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
              // (device["kathaNumber"] ?? "")
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
              // backgroundColor: Colors.white,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        width: 210,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.blue, Colors.teal],
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const AddTree(),
                              ),
                            );
                          },
                          child: Text(
                            'Add Tree',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView(
                        children: filteredDeviceList.map((device) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 10, right: 10),
                            child: Container(
                              // width: MediaQuery.of(context).size.height * 0.4,
                              height: MediaQuery.of(context).size.height * 0.2,
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
                                      builder: (context) =>
                                          TreeInfo(device["id"] ?? ""),
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
                                            SizedBox(width: 160),
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
                                            const Text('kathaNumber'),
                                            SizedBox(
                                              width: 74,
                                            ),
                                            Text(
                                              device["kathaNumber"] ?? "user",
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          children: [
                                            const Text('surveyNumber'),
                                            SizedBox(
                                              width: 70,
                                            ),
                                            Text(
                                              device["surveyNumber"] ?? "",
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          children: [
                                            const Text('numberOfTrees'),
                                            SizedBox(
                                              width: 63,
                                            ),
                                            Text(
                                              device["numberOfTrees"] ?? "",
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
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            );
          }
        });
  }
}
