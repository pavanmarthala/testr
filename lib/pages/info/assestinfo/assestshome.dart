import 'package:eco/pages/Drawer.dart';
import 'package:flutter/material.dart';

class Myprofile extends StatelessWidget {
  Widget listTile({required IconData icon, required String title}) {
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          "My Profile",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      drawer: Mydrawer(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 120,
                color: Colors.lightBlue,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.vertical,
              ),
              Expanded(
                child: Container(
                  height: 650,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: const BoxDecoration(
                      color: Color(0xffcbcbcb),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: ListView(
                    children: [
                      const SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 250,
                            height: 80,
                            padding: const EdgeInsets.only(left: 20),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "pavan",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("pavanmarthala36@gmail.com")
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.lightBlue,
                                  child: CircleAvatar(
                                    radius: 12,
                                    child: Icon(Icons.edit,
                                        color: Colors.lightBlue),
                                    backgroundColor: Color(0xffcbcbcb),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      ListTile(
                        leading: const Icon(Icons.shop_outlined),
                        title: const Text("My Orders"),
                        onTap: () {},
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        leading: const Icon(Icons.location_on_outlined),
                        title: const Text("My Address"),
                        onTap: () {},
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        leading: const Icon(Icons.file_copy_outlined),
                        title: const Text("Terms & conditions"),
                        onTap: () {},
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        leading: const Icon(Icons.person_outlined),
                        title: const Text("Refer A friend"),
                        onTap: () {},
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        leading: const Icon(Icons.policy_outlined),
                        title: const Text("Privacy Policy"),
                        onTap: () {},
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        leading: const Icon(Icons.format_quote_outlined),
                        title: const Text("FAQs"),
                        onTap: () {},
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 60, left: 40),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.lightBlue,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/profile.webp"),
                radius: 45,
                backgroundColor: Color(0xffcbcbcb),
              ),
            ),
          )
        ],
      ),
    );
  }
}
