import 'package:eco/auth/signin.dart';
import 'package:eco/pages/User_homePage.dart';
import 'package:eco/pages/info/assestinfo/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDeawer extends StatefulWidget {
  const UserDeawer({Key? key}) : super(key: key);

  @override
  _UserDeawerState createState() => _UserDeawerState();
}

class _UserDeawerState extends State<UserDeawer> {
  void logout() async {
    // Clear user login details from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    prefs.remove('password');
    prefs.remove('jwt_token');

    // Navigate back to the login page
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => SingIN()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Image.asset(
                "assets/EcoHex_Logo-removebg-preview.png",
                // scale: 5,
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 35,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                      height: 30,
                      child: outlineButton(
                        onPressed: () {},
                        child: const Text("login"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(width: 2)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ListTile(
              leading: const Icon(
                Icons.home_outlined,
                color: Colors.black,
              ),
              title: const Text(
                "Home",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
              ),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                String? username = prefs.getString('username');
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => UserHomePage(username!)),
                );
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.shop_outlined),
            //   title: const Text("Review Cart"),
            //   onTap: () {
            //     //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Review(),),);
            //   },
            // ),
            ListTile(
              leading: const Icon(
                Icons.person_outlined,
                color: Colors.black,
              ),
              title: const Text(
                "My Profile",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Myprofile(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              ),
              title: const Text(
                "Notification",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.star_outlined,
                color: Colors.black,
              ),
              title: const Text(
                "Rating",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
              ),
              onTap: () {},
            ),
            // ListTile(
            //   leading: const Icon(Icons.favorite_outlined),
            //   title: const Text("Wishlist"),
            //   onTap: () {},
            // ),
            // ListTile(
            //   leading: const Icon(Icons.copy_outlined),
            //   title: const Text("Raise a Complaint"),
            //   onTap: () {},
            // ),
            ListTile(
              leading: const Icon(
                Icons.exit_to_app_outlined,
                color: Colors.black,
              ),
              title: const Text(
                "Log out",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
              ),
              onTap: () {
                logout();
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
            ),

            Container(
              height: 350,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "contact support",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "call us:",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "123456789",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          "Mail us:",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Support@gmail.com",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  outlineButton(
      {required Null Function() onPressed,
      required Text child,
      required RoundedRectangleBorder shape}) {}
}
