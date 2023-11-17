// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, unused_element

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class TreeInfo extends StatefulWidget {
  final String treeId;

  TreeInfo(this.treeId, {Key? key}) : super(key: key);

  @override
  _TreeInfoState createState() => _TreeInfoState();
}

class _TreeInfoState extends State<TreeInfo> {
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
        Uri.parse('https://api.ecohex.in/tree/getTree/${widget.treeId}'),
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

  Future<void> _showImageSourceDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _pickImage();
              },
              child: Text('Camera'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _pickImagefromgallary();
              },
              child: Text('Gallery'),
            ),
          ],
        );
      },
    );
  }

  Future _pickImagefromgallary() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked == null) return;
    setState(() {
      _selectedImage = File(picked.path);
    });
  }

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.camera);
    if (picked == null) return;
    setState(() {
      _selectedImage = File(picked.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.teal, Colors.blue],
            ),
          ),
        ),
        title: const Text(
          'Tree Info',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
            Map<String, dynamic> treeData = snapshot.data!;
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
                          value: treeData['id'].toString(),
                          gradientColors: [Colors.blue, Colors.teal],
                        ),
                        UserInfoRow(
                          label: 'userId',
                          value: treeData['userId'].toString(),
                          gradientColors: [Colors.blue, Colors.teal],
                        ),
                        UserInfoRow(
                          label: 'ageOfTheTree',
                          value: treeData['ageOfTheTree'].toString(),
                          gradientColors: [Colors.blue, Colors.teal],
                        ),
                        UserInfoRow(
                            label: 'kathaNumber',
                            value: treeData['kathaNumber'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'surveyNumber',
                            value: treeData['surveyNumber'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'landExtent',
                            value: treeData['landExtent'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'landType',
                            value: treeData['landType'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'geoLocation',
                            value: treeData['geoLocation'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'height',
                            value: treeData['height'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'steamDiameter',
                            value: treeData['steamDiameter'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'greenWeightAboveGround',
                            value:
                                treeData['greenWeightAboveGround'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'greenWeight',
                            value: treeData['greenWeight'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'dryWeight',
                            value: treeData['dryWeight'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'carbonWeight',
                            value: treeData['carbonWeight'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'totalCO2SequesteredPerTree',
                            value: treeData['totalCO2SequesteredPerTree']
                                .toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'totalCO2Sequestered',
                            value: treeData['totalCO2Sequestered'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'totalCO2SequesteredPerYear',
                            value: treeData['totalCO2SequesteredPerYear']
                                .toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'totalCarbonCredits',
                            value: treeData['totalCarbonCredits'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'totalCarbonCreditsPerYear',
                            value: treeData['totalCarbonCreditsPerYear']
                                .toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        UserInfoRow(
                            label: 'co2Sequestered',
                            value: treeData['co2Sequestered'].toString(),
                            gradientColors: [Colors.blue, Colors.teal]),
                        _selectedImage != null
                            ? Image.file(_selectedImage!)
                            : Text('palese select image')
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _pickImagefromgallary,
        onPressed: _showImageSourceDialog,
        tooltip: 'Upload Image',
        child: Icon(Icons.image),
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
