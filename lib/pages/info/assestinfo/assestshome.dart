// ignore_for_file: prefer_const_constructors

import 'package:eco/auth/signin.dart';
import 'package:eco/pages/assestslandingpage.dart';
import 'package:eco/pages/info/assestinfo/user_assets.dart';
import 'package:eco/pages/info/user_info.dart';
import 'package:flutter/material.dart';

class AssestsHomepage extends StatefulWidget {
  const AssestsHomepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<AssestsHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffcbcbcb),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 112, 112, 205),
        title: const Text(
          'Home page',
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return AssetsLandingPage();
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(0.0, 1.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInBack;
                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Hero(
                  tag: 'userInfo',
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: AssetImage('assets/crops_image.jpg'),
                          fit: BoxFit.cover,
                          // height: MediaQuery.of(context).size.height * 0.2, // Adjust the height as needed
                          // width: MediaQuery.of(context).size.height * 0.5,
                        ),
                        // Image.asset('assets/EcoHex_Logo-removebg-preview.png'),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(
                  //   PageRouteBuilder(
                  //     pageBuilder: (context, animation, secondaryAnimation) {
                  //       return UserAssets();
                  //     },
                  //     transitionsBuilder:
                  //         (context, animation, secondaryAnimation, child) {
                  //       const begin = Offset(0.0, 1.0);
                  //       const end = Offset.zero;
                  //       const curve = Curves.easeInOut;
                  //       var tween = Tween(begin: begin, end: end)
                  //           .chain(CurveTween(curve: curve));
                  //       var offsetAnimation = animation.drive(tween);

                  //       return SlideTransition(
                  //         position: offsetAnimation,
                  //         child: child,
                  //       );
                  //     },
                  //   ),
                  // );
                },
                child: Hero(
                  tag: 'userAssets',
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/Trees_image.png'),
                          fit: BoxFit.cover,
                          // height: MediaQuery.of(context).size.height * 0.2, // Adjust the height as needed
                          // width: MediaQuery.of(context).size.height * 0.5,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}