// ignore_for_file: prefer_const_constructors

import 'package:eco/auth/signin.dart';
import 'package:eco/pages/HomePage.dart';
import 'package:flutter/material.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white), // Set back button color to white
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.teal, Colors.blue],
            ),
          ),
        ), // Change the app bar color
        title: const Text(
          'Welcome To ECOHEX',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
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
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
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
                    fillColor: Colors.white,
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
                  height: 90,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blue, Colors.teal],
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  // Remove the border property to get rid of the black border

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            (const Text(
                              'ID',
                              style: TextStyle(color: Colors.white),
                            )),
                            SizedBox(
                              width: MediaQuery.of(context).size.height * 0.14,
                            ),
                            (const Text(
                              ':  9700930088',
                              style: TextStyle(color: Colors.white),
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
                              style: TextStyle(color: Colors.white),
                            )),
                            SizedBox(
                              width: 53,
                            ),
                            (const Text(
                              ':  sai ',
                              style: TextStyle(color: Colors.white),
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
                              style: TextStyle(color: Colors.white),
                            )),
                            SizedBox(
                              width: 63,
                            ),
                            (const Text(
                              ':  Admin',
                              style: TextStyle(color: Colors.white),
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
