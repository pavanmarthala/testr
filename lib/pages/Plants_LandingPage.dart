// ignore_for_file: prefer_const_constructors

import 'package:eco/pages/info/Add_Plant.dart';
import 'package:eco/pages/info/assestinfo/Plants_info.dart';
import 'package:flutter/material.dart';

class PlantsLandingPage extends StatefulWidget {
  const PlantsLandingPage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<PlantsLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      //   ), // Change the app bar color
      //   title: const Text(
      //     'View User Assets(Trees)',
      //     style: TextStyle(
      //         fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(
      //             builder: (context) => SingIN(),
      //           ),
      //         );
      //       },
      //       icon: Icon(
      //         Icons.exit_to_app,
      //         size: 30,
      //         color: Colors.white,
      //       ),
      //     )
      //   ],
      // ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
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
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   width: 110,
                //   decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //       begin: Alignment.topLeft,
                //       end: Alignment.bottomRight,
                //       colors: [Colors.teal, Colors.blue],
                //     ),
                //     borderRadius: BorderRadius.circular(10.0),
                //   ),
                //   child: TextButton(
                //     onPressed: () {
                //       Navigator.of(context).push(
                //         MaterialPageRoute(
                //           builder: (context) => const AssestsHomepage(),
                //         ),
                //       );
                //     },
                //     child: Text(
                //       'Home',
                //       style: TextStyle(color: Colors.white),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                    width: 210,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.blue, Colors.teal],
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AddPlant(),
                          ),
                        );
                      },
                      child: Text(
                        'Add Plant',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PlantInfo(),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.height * 0.5,
                  height: 140,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.teal, Colors.blue],
                    ),
                    borderRadius: BorderRadius.circular(15),
                    // Set border to null to remove it
                    border: null,
                  ),
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
                              width: MediaQuery.of(context).size.height * 0.16,
                            ),
                            (const Text(
                              ':  8897784992',
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
                              width: MediaQuery.of(context).size.height * 0.12,
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
                              'KathaNumber',
                              style: TextStyle(color: Colors.white),
                            )),
                            SizedBox(
                              width: MediaQuery.of(context).size.height * 0.032,
                            ),
                            (const Text(
                              ':  4992',
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
                              width: MediaQuery.of(context).size.height * 0.14,
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
      // bottomNavigationBar: SafeArea(
      //   child: Container(
      //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //         colors: [Colors.teal, Colors.blue],
      //       ),
      //       borderRadius: BorderRadius.circular(24),
      //     ),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         Container(
      //           width: 85,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(10.0),
      //           ),
      //           child: TextButton(
      //             onPressed: () {
      //               Navigator.of(context).push(
      //                 MaterialPageRoute(
      //                   builder: (context) => const AssestsHomepage(),
      //                 ),
      //               );
      //             },
      //             child: Text(
      //               'Home',
      //               style: TextStyle(color: Colors.white),
      //             ),
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(left: 8),
      //           child: Container(
      //             width: 85,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(10.0),
      //             ),
      //             child: TextButton(
      //               onPressed: () {
      //                 Navigator.of(context).push(
      //                   MaterialPageRoute(
      //                     builder: (context) => const AddTree(),
      //                   ),
      //                 );
      //               },
      //               child: Text(
      //                 'Add Tree',
      //                 style: TextStyle(color: Colors.white),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
