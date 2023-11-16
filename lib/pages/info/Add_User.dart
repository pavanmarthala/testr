// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, no_leading_underscores_for_local_identifiers, deprecated_member_use

import 'package:flutter/material.dart';

class Adduser extends StatefulWidget {
  const Adduser({super.key});

  @override
  State<Adduser> createState() => _dataState();

  // void onDeviceAdded(String deviceName) {}
}

class _dataState extends State<Adduser> {
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
          "Add User",
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
                'Mobile Number',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _mobileNocontroller,
                decoration: InputDecoration(
                  hintText: 'Enter Mobile Number',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'First Name',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _firstnameController,
                decoration: InputDecoration(
                  hintText: 'Enter first name',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'last Name',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _lastnameController,
                decoration: InputDecoration(
                  hintText: 'Enter last Name',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Email Id',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter email id',
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
                'PIN',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _pinController,
                decoration: InputDecoration(
                  hintText: 'Enter Device Pin',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Role',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _rolecontroller,
                decoration: InputDecoration(
                  hintText: 'Enter prefered role',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Preferd language',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _languagecontroller,
                decoration: InputDecoration(
                  hintText: 'Enter Preferd language',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Role',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _rolecontroller,
                decoration: InputDecoration(
                  hintText: 'Enter prefered role',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Address Line 1',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _address1controller,
                decoration: InputDecoration(
                  hintText: 'Enter address line 1',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Address Line 2',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _address2controller,
                decoration: InputDecoration(
                  hintText: 'Enter address line 2',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Address Line 3',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextField(
                controller: _address3controller,
                decoration: InputDecoration(
                  hintText: 'Enter address line 3',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'State',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _statecontroller,
                decoration: InputDecoration(
                  hintText: 'Enter state',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'District',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _districtcontroller,
                decoration: InputDecoration(
                  hintText: 'Enter district',
                ),
              ),
              Text(
                'zone',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _zonecontroller,
                decoration: InputDecoration(
                  hintText: 'Enter zone',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'City',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _citycontroller,
                decoration: InputDecoration(
                  hintText: 'Enter city',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Land mark',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextField(
                controller: _landmarkcontroller,
                decoration: InputDecoration(
                  hintText: 'Enter landmark',
                ),
              ),
              SizedBox(
                height: 90,
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
                primary: Color.fromARGB(
                    255, 112, 112, 205), // Change the button's background color
                fixedSize: Size(500, 50), // Increase the button's size
              ),
              child: Text(
                'Add User',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
