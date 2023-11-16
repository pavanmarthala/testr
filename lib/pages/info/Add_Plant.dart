// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, no_leading_underscores_for_local_identifiers, deprecated_member_use

import 'package:flutter/material.dart';

class AddPlant extends StatefulWidget {
  const AddPlant({super.key});

  @override
  State<AddPlant> createState() => _dataState();

  // void onDeviceAdded(String deviceName) {}
}

class _dataState extends State<AddPlant> {
  @override
  Widget build(BuildContext context) {
    final _lastnameController = TextEditingController();
    final _firstnameController = TextEditingController();
    final _pinController = TextEditingController();
    final _emailController = TextEditingController();
    final _subscriptioncontroller = TextEditingController();
    final _zonecontroller = TextEditingController();
    final _languagecontroller = TextEditingController();
    final _mobileNocontroller = TextEditingController();
    final _rolecontroller = TextEditingController();
    final _address1controller = TextEditingController();
    final _address2controller = TextEditingController();
    final _address3controller = TextEditingController();
    final _statecontroller = TextEditingController();
    final _districtcontroller = TextEditingController();
    final _citycontroller = TextEditingController();
    final _landmarkcontroller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          "Add New Tree",
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
                'Age Of The Plant (years)',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _mobileNocontroller,
                decoration: InputDecoration(
                    //hintText: 'Enter Mobile Number',
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Number Of Plant',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _firstnameController,
                decoration: InputDecoration(
                    // hintText: 'Enter first name',
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Katha Number',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _lastnameController,
                decoration: InputDecoration(
                  hintText: 'Enter Katha Number',
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
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter Survey Number',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Text(
              //   'Subscription validity Till',
              //   style: Theme.of(context).textTheme.headline6,
              // ),
              // TextField(
              //   controller: _subscriptioncontroller,
              //   decoration: InputDecoration(
              //     hintText: 'select validity',
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Land Extent',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _pinController,
                decoration: InputDecoration(
                    //hintText: 'Enter Device Pin',
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
                controller: _rolecontroller,
                decoration: InputDecoration(
                  hintText: 'Enter Land Type',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Height (meters)',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _languagecontroller,
                decoration: InputDecoration(
                    // hintText: 'Enter Preferd language',
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
                controller: _rolecontroller,
                decoration: InputDecoration(
                    // hintText: 'Enter prefered role',
                    ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SafeArea(
          child: Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Change the button's background color
                fixedSize: Size(500, 50), // Increase the button's size
              ),
              child: Text(
                'Add Plant',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
