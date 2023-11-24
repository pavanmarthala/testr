// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:eco/admin_pages/admin_deawer.dart';
import 'package:eco/admin_pages/admin_profile_Page.dart';
import 'package:eco/admin_pages/navgation_bar_items/admin_cropslanding_page.dart';
import 'package:eco/admin_pages/navgation_bar_items/admin_treelanding_page.dart';
import 'package:eco/admin_pages/navgation_bar_items/user_info.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Adminhomepage extends StatefulWidget {
  final String userId;

  Adminhomepage(this.userId, {super.key});
  @override
  _AdminhomepageState createState() => _AdminhomepageState();
}

class _AdminhomepageState extends State<Adminhomepage> {
  int index = 0;
  List<Widget> screens = [];

  @override
  void initState() {
    super.initState();

    screens = [
      UserInfo(widget.userId),
      Admintreelanding(widget.userId),
      Admincropslanding(),
    ];
  }

  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  final _advancedDrawerController = AdvancedDrawerController();

  Map<String, dynamic> decodeJwt(String token) {
    try {
      return JwtDecoder.decode(token);
    } catch (e) {
      print('Error decoding JWT: $e');
      return {};
    }
  }

  Future<bool> checkUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwtToken = prefs.getString('jwt_token');

    if (jwtToken != null) {
      Map<String, dynamic> decodedToken = decodeJwt(jwtToken);
      List<dynamic> authorities = decodedToken['authorities'];

      return authorities.contains('admin') ||
          authorities.contains('superAdmin');
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blueGrey.withOpacity(0.2),
              Colors.blueGrey,
            ],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 300),
      animateChildDecoration: true,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      drawer: Admindrawer(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Home page',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Adminprofilepage()),
                  );
                },
                icon: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.black,
                ))
          ],
        ),
        backgroundColor: Colors.teal,
        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            backgroundColor: Colors.transparent,
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          child: NavigationBar(
            height: 60,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.person),
                label: 'User Info',
              ),
              NavigationDestination(
                icon: Icon(Icons.park),
                label: 'Tree Info',
              ),
              NavigationDestination(
                icon: Icon(Icons.eco),
                label: 'Crops Info',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
