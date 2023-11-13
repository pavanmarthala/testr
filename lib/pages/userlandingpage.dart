// ignore_for_file: prefer_const_constructors

import 'package:eco/auth/signin.dart';
import 'package:eco/pages/info/addtree.dart';
import 'package:eco/pages/info/assestinfo/assestshome.dart';
import 'package:eco/pages/info/assestinfo/user_assets.dart';
import 'package:eco/pages/info/user_info.dart';
import 'package:flutter/material.dart';

class UserLandingPage extends StatefulWidget {
  const UserLandingPage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<UserLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffcbcbcb),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 112, 112, 205),
        title: const Text(
          'View User Info',
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
                      builder: (context) => UserInfo(),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.height * 0.5,
                  height: 110,
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
          ],
        ),
      ),
    );
  }
}