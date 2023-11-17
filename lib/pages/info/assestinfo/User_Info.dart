// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, unused_element

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UserInfo extends StatefulWidget {
  final String UserId;

  UserInfo(this.UserId, {Key? key}) : super(key: key);

  @override
  _TreeInfoState createState() => _TreeInfoState();
}

class _TreeInfoState extends State<UserInfo> {
  late Future<Map<String, dynamic>> treeInfo;
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    treeInfo = fetchTreeInfo();
  }

  Future<Map<String, dynamic>> fetchTreeInfo() async {
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
    try {
      final response = await http.get(
        Uri.parse('https://api.ecohex.in/user/get/${widget.UserId}'),
        headers: {
          "Authorization": "Bearer $jwtToken",
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: treeInfo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            Map<String, dynamic> UserData = snapshot.data!;
            return Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Scrollbar(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        UserInfoRow(
                          label: 'ID',
                          value: UserData['id'].toString(),
                          gradientColors: [Colors.blue, Colors.teal],
                        ),
                        UserInfoRow(
                          label: 'Email',
                          value: UserData['email'].toString(),
                          gradientColors: [Colors.blue, Colors.teal],
                        ),
                        UserInfoRow(
                          label: 'Password',
                          value: UserData['password'].toString(),
                          gradientColors: [Colors.blue, Colors.teal],
                        ),
                        UserInfoRow(
                            label: 'Name',
                            value: UserData['name'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'FirstName',
                            value: UserData['firstName'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'LastName',
                            value: UserData['lastName'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'landType',
                            value: UserData['landType'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'Address1',
                            value: UserData['address1'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'Address2',
                            value: UserData['address2'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'District',
                            value: UserData['district'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'State',
                            value: UserData['state'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'Country',
                            value: UserData['country'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'PinCode',
                            value: UserData['pinCode'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'Role',
                            value: UserData['role'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'AadhaarNumber',
                            value: UserData['aadhaarNumber'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'AadhaarUploaded',
                            value: UserData['aadhaarUploaded'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'khataBookUploaded',
                            value: UserData['khataBookUploaded'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'verified',
                            value: UserData['verified'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class UserInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final List<Color> gradientColors;

  const UserInfoRow({
    Key? key,
    required this.label,
    required this.value,
    required this.gradientColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 14.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
