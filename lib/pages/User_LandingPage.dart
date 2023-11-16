// ignore_for_file: prefer_const_constructors

import 'package:eco/auth/signin.dart';
import 'package:eco/pages/info/Add_Tree.dart';
import 'package:eco/pages/info/assestinfo/Tree_Info.dart';
import 'package:eco/pages/info/assestinfo/assestshome.dart';

import 'package:flutter/material.dart';

class AssetsLandingPage extends StatefulWidget {
  const AssetsLandingPage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<AssetsLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffcbcbcb),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 112, 112, 205),
          title: const Text(
            'View User Assets',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SingIN(),
                  ),
                );
              },
              icon: Icon(
                Icons.exit_to_app,
                size: 30,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                // child: Image.asset("assets/EcoHex_Logo-removebg-preview.png"),
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
                        builder: (context) => TreeInfo(),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.height * 0.5,
                    height: 140,
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                                ':  8897784992',
                                // style: TextStyle(color: Colors.white),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 100, top: 5, bottom: 5),
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
                          padding: const EdgeInsets.only(left: 5, right: 50),
                          child: Row(
                            children: [
                              (const Text(
                                'KathaNumber',
                                // style: TextStyle(color: Colors.white),
                              )),
                              SizedBox(
                                width: MediaQuery.of(context).size.height * 0.1,
                              ),
                              (const Text(
                                ': 4992',
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
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 160, top: 5, bottom: 5),
            decoration: const BoxDecoration(
                //color:  Color.fromARGB(255, 112, 112, 205),
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: SizedBox(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 85,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 112, 112, 205),

                        borderRadius:
                            BorderRadius.circular(10.0), // Rounded border
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AssestsHomepage(),
                            ),
                          );

                          // Go back to Home Screen
                        },
                        child: Text(
                          'Home',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        width: 85,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 112, 112, 205),

                          borderRadius:
                              BorderRadius.circular(10.0), // Rounded border
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const AddTree(),
                              ),
                            );

                            // Go back to Home Screen
                          },
                          child: Text(
                            'Add Tree',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
