// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eco/pages/add_user.dart';
import 'package:eco/pages/homepage.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatefulWidget {
  const Mydrawer({Key? key}) : super(key: key);

  @override
  _MydrawerState createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Image.asset("assets/EcoHex_Logo-removebg-preview.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.height * 0.5,
              height: 50,
              child: TextField(
                onChanged: (value) {},
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
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Homepage(),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.height * 0.5,
                height: 110,
                decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all()),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          (const Text(
                            'ID',
                            // style: TextStyle(color: Colors.white),
                          )),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.1,
                          ),
                          (const Text(
                            ':  9700930088',
                            // style: TextStyle(color: Colors.white),
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          (const Text(
                            'Name',
                            // style: TextStyle(color: Colors.white),
                          )),
                          SizedBox(
                            width: 53,
                          ),
                          (const Text(
                            ':  sai ',
                            // style: TextStyle(color: Colors.white),
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          (const Text(
                            'Role',
                            // style: TextStyle(color: Colors.white),
                          )),
                          SizedBox(
                            width: 63,
                          ),
                          (const Text(
                            ':  Admin',
                            // style: TextStyle(color: Colors.white),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Adduser(),
                  ),
                );
              },
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Icon(Icons.person_add),
                    Text('  Add User'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
