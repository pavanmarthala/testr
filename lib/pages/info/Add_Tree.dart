import 'dart:convert';
import 'package:eco/pages/Tree_LandingPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddTree extends StatefulWidget {
  final String? selectedState;

  const AddTree({Key? key, this.selectedState}) : super(key: key);

  @override
  _AddTreeState createState() => _AddTreeState(selectedState: selectedState);
}

class _AddTreeState extends State<AddTree> {
  String? selectedState;
  final _AgeOfTree = TextEditingController();
  final _NumOfTree = TextEditingController();
  final _KathaNumber = TextEditingController();
  final _SurveyNumber = TextEditingController();
  final _LandExtent = TextEditingController();
  final _LandType = TextEditingController();
  final _Height = TextEditingController();
  final _SteamDiameter = TextEditingController();

  _AddTreeState({this.selectedState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Add Tree",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueGrey.withOpacity(0.2),
                Colors.blueGrey,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextField('Age Of Trees (years)', _AgeOfTree),
              _buildTextField('Number Of Trees', _NumOfTree),
              _buildTextField('Katha number', _KathaNumber),
              _buildTextField('Survey Number', _SurveyNumber),
              _buildTextField('Land Extent', _LandExtent),
              _buildTextField('Land Type', _LandType),
              _buildTextField('Height (meters)', _Height),
              _buildTextField('Steam Diameter (centimeters)', _SteamDiameter),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await _addTree();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Add Tree',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Future<void> _addTree() async {
    // Replace this URL with your actual API endpoint
    const String apiUrl = 'https://api.ecohex.in/tree/add';

    // Prepare the request body
    Map<String, dynamic> requestBody = {
      "ageOfTree": _AgeOfTree.text,
      "numberOfTrees": _NumOfTree.text,
      "kathaNumber": _KathaNumber.text,
      "surveyNumber": _SurveyNumber.text,
      "landExtent": _LandExtent.text,
      "landType": _LandType.text,
      "height": _Height.text,
      "steamDiameter": _SteamDiameter.text,
    };

    // Get the JWT token from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwtToken = prefs.getString('jwt_token');

    if (jwtToken == null) {
      // Handle the case where the token is missing
      return;
    }

    // Prepare the headers with the JWT token
    Map<String, String> headers = {
      'Authorization': 'Bearer $jwtToken',
      'Content-Type': 'application/json',
    };

    try {
      // Make the API POST request with headers and request body
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        // Request was successful
        print('API request successful');

        // Parse the response if needed
        final responseJson = jsonDecode(response.body);

        // Handle the response data as required

        // Navigate to TreeLandingPage on successful tree addition
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TreeLandingPage(""),
          ),
        );
      } else {
        // Request failed
        print('API request failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        // You can handle the error here
      }
    } catch (error) {
      // Request failed
      print('API request failed with error: $error');
      // You can handle the error here
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: AddTree(),
  ));
}
