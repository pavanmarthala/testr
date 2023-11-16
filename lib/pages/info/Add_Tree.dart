// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace, camel_case_types, body_might_complete_normally_nullable, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'dart:convert';

import 'package:eco/pages/Tree_LandingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AddTree extends StatefulWidget {
  final String? selectedState;

  const AddTree({Key? key, this.selectedState}) : super(key: key);

  @override
  _AddTreeState createState() => _AddTreeState(selectedState: selectedState);
}

class _AddTreeState extends State<AddTree> with SingleTickerProviderStateMixin {
  String? selectedState;
  String? selectedDistrict;

  _AddTreeState({this.selectedState});
  final _AgeOfTree = TextEditingController();
  final _NumOfTree = TextEditingController();
  final _KathaNumber = TextEditingController();
  final _SurveyNumber = TextEditingController();
  final _LandExtent = TextEditingController();
  final _LandType = TextEditingController();
  final _Height = TextEditingController();
  final _SteamDiameter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  String AgeOfTree = _AgeOfTree.text;
                  String NumOFTree = _NumOfTree.text;
                  String KathaNUmber = _KathaNumber.text;
                  String SurveyNumber = _SurveyNumber.text;
                  String LandExtent = _LandExtent.text;
                  String LandType = _LandType.text;
                  String Height = _Height.text;
                  String SteamDiameter = _SteamDiameter.text;

                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  String? jwtToken = prefs.getString('jwt_token');

                  if (jwtToken == null) {
                    // Handle the case where the token is missing
                    return;
                  }

                  // Prepare the request body to match the API's expected structure
                  Map<String, dynamic> requestBody = {
                    "ageOfTheTree": AgeOfTree,
                    "numberOfTrees": NumOFTree,
                    "kathaNumber": KathaNUmber,
                    "surveyNumber": SurveyNumber,
                    "landExtent": LandExtent,
                    "landType": LandType,
                    "height": Height,
                    "steamDiameter": SteamDiameter
                  };

                  // Prepare the headers with the JWT token
                  Map<String, String> headers = {
                    'Authorization': 'Bearer $jwtToken',
                    'Content-Type': 'application/json',
                  };

                  // Make the API POST request with headers and request body
                  Uri apiUrl = Uri.parse('https://api.ecohex.in/tree/add');
                  http
                      .post(
                    apiUrl,
                    headers: headers,
                    body: jsonEncode(requestBody),
                  )
                      .then((response) {
                    if (response.statusCode == 200) {
                      // Request was successful
                      print('API request successful');

                      // Parse the response if needed
                      final responseJson = jsonDecode(response.body);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TreeLandinpPage(),
                        ),
                      );
                      // Handle the response data as required
                    } else {
                      // Request failed
                      print(
                          'API request failed with status code: ${response.statusCode}');
                      print('Response body: ${response.body}');
                      // You can handle the error here
                    }
                  }).catchError((error) {
                    // Request failed
                    print('API request failed with error: $error');
                    // You can handle the error here
                  });
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue, fixedSize: Size(250, 70)
                    // padding: EdgeInsets.symmetric(
                    //     vertical: 10, horizontal: 20), // Adjust padding for size
                    ),
                child: Text('Add Tree',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Add_Tree",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Age Of Trees(years)',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _AgeOfTree,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  hintText: 'enter_Trees_Age',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Number Of Trees',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _NumOfTree,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  hintText: 'Enter_NumberOf_Trees',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Katha number',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _KathaNumber,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  hintText: 'Enter Katha number',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Survey Number',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _SurveyNumber,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  hintText: 'Enter Survey number',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Land Extent',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _LandExtent,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  hintText: 'Enter Land Extent',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Land Type',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _LandType,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  hintText: 'Enter Land Type',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Height(meters)',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _Height,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  hintText: 'Enter Height (meters)',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Steam Diameter (centi meters)',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _SteamDiameter,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  hintText: 'Enter Steam Diameter (centi meters)',
                ),
              ),
              // ... (other text fields)
            ],
          ),
        ),
      ),
    );
  }
}
