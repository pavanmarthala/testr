// ignore_for_file: prefer_const_constructors

import 'package:eco/auth/signin.dart';
import 'package:eco/pages/Drawer.dart';
import 'package:eco/pages/Plants_LandingPage.dart';
import 'package:eco/pages/Tree_LandingPage.dart';
import 'package:eco/pages/info/assestinfo/User_Info.dart';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int index = 0;
  List<Widget> screens = [];

  @override
  void initState() {
    super.initState();
    screens = [
      UserInfo(),
      TreeLandinpPage(),
      PlantsLandingPage(),
    ];
  }

  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  final _advancedDrawerController = AdvancedDrawerController();

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
      drawer: Mydrawer(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.teal, Colors.blue],
              ),
            ),
          ),
          title: const Text(
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
            destinations: [
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
                label: 'Plant Info',
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
