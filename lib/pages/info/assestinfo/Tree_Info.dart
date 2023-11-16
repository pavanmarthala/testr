import 'package:flutter/material.dart';

class TreeInfo extends StatefulWidget {
  const TreeInfo({Key? key}) : super(key: key);

  @override
  State<TreeInfo> createState() => _TreeInfoState();
}

class _TreeInfoState extends State<TreeInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   iconTheme: IconThemeData(
      //       color: Colors.white), // Set back button color to white
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //         colors: [Colors.teal, Colors.blue],
      //       ),
      //     ),
      //   ),
      //   title: const Text(
      //     'User Info',
      //     style: TextStyle(
      //         fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      //   ),
      // ),
      body: Container(
        color: Colors.white, // Set the background color for the entire screen
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Scrollbar(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  UserInfoRow(
                      label: 'ID',
                      value: '213',
                      gradientColors: [Colors.blue, Colors.teal]),
                  UserInfoRow(
                      label: 'Email',
                      value: 'asairakesh213@gmail.com',
                      gradientColors: [Colors.blue, Colors.teal]),
                  UserInfoRow(
                      label: 'Password',
                      value: 'Text',
                      gradientColors: [Colors.blue, Colors.teal]),
                  UserInfoRow(
                      label: 'Name',
                      value: 'sairakesh',
                      gradientColors: [Colors.blue, Colors.teal]),
                  UserInfoRow(
                      label: 'FirstName',
                      value: 'sai',
                      gradientColors: [Colors.blue, Colors.teal]),
                  UserInfoRow(
                      label: 'LastName',
                      value: 'rakesh',
                      gradientColors: [Colors.blue, Colors.teal]),
                  UserInfoRow(
                      label: 'Address1',
                      value: 'Text',
                      gradientColors: [Colors.blue, Colors.teal]),
                  UserInfoRow(
                      label: 'Address2',
                      value: 'Text',
                      gradientColors: [Colors.blue, Colors.teal]),
                  UserInfoRow(
                      label: 'District',
                      value: 'Text',
                      gradientColors: [Colors.blue, Colors.teal]),
                  UserInfoRow(
                      label: 'State',
                      value: 'Text',
                      gradientColors: [Colors.blue, Colors.teal]),
                  UserInfoRow(
                      label: 'Country',
                      value: 'Text',
                      gradientColors: [Colors.blue, Colors.teal]),
                  UserInfoRow(
                      label: 'PinCode',
                      value: 'Text',
                      gradientColors: [Colors.blue, Colors.teal]),
                  UserInfoRow(
                      label: 'Role',
                      value: 'Text',
                      gradientColors: [Colors.blue, Colors.teal]),
                  UserInfoRow(
                      label: 'AadhaarNumber',
                      value: 'Text',
                      gradientColors: [Colors.blue, Colors.teal]),
                  UserInfoRow(
                      label: 'AadhaarUploaded',
                      value: 'Text',
                      gradientColors: [Colors.blue, Colors.teal]),
                  UserInfoRow(
                      label: 'KhataBookUploaded',
                      value: 'Text',
                      gradientColors: [Colors.blue, Colors.teal]),
                  UserInfoRow(
                      label: 'Verified',
                      value: 'Text',
                      gradientColors: [Colors.blue, Colors.teal]),
                ],
              ),
            ),
          ),
        ),
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
