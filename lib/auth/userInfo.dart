// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EditUser extends StatefulWidget {
  const EditUser({Key? key}) : super(key: key);

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Info'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                      style: BorderStyle
                          .solid, // Border style (you can use dotted or dashed too)
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Container(
                          width: 190,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (const Text('ID')),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                        ),
                        child: Container(
                          width: 197,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (Text('text')),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                      style: BorderStyle
                          .solid, // Border style (you can use dotted or dashed too)
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Container(
                          width: 190,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (const Text('Name')),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                        ),
                        child: Container(
                          width: 197,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (Text('text')),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                      style: BorderStyle
                          .solid, // Border style (you can use dotted or dashed too)
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Container(
                          width: 190,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (const Text('Address1')),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                        ),
                        child: Container(
                          width: 197,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (Text('text')),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                      style: BorderStyle
                          .solid, // Border style (you can use dotted or dashed too)
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Container(
                          width: 190,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (const Text('State')),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                        ),
                        child: Container(
                          width: 197,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (Text('text')),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                      style: BorderStyle
                          .solid, // Border style (you can use dotted or dashed too)
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Container(
                          width: 190,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (const Text('Role')),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                        ),
                        child: Container(
                          width: 197,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (Text('text')),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                      style: BorderStyle
                          .solid, // Border style (you can use dotted or dashed too)
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Container(
                          width: 190,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (const Text('KhataBookUploaded')),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                        ),
                        child: Container(
                          width: 197,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (Text('text')),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                      style: BorderStyle
                          .solid, // Border style (you can use dotted or dashed too)
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Container(
                          width: 190,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (const Text("Email")),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                        ),
                        child: Container(
                          width: 197,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (Text('text')),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                      style: BorderStyle
                          .solid, // Border style (you can use dotted or dashed too)
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Container(
                          width: 190,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (const Text("FirstName")),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                        ),
                        child: Container(
                          width: 197,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (Text('text')),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                      style: BorderStyle
                          .solid, // Border style (you can use dotted or dashed too)
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Container(
                          width: 190,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (const Text("Address2")),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                        ),
                        child: Container(
                          width: 197,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (Text('text')),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                      style: BorderStyle
                          .solid, // Border style (you can use dotted or dashed too)
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Container(
                          width: 190,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (const Text("Country")),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                        ),
                        child: Container(
                          width: 197,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (Text('text')),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                      style: BorderStyle
                          .solid, // Border style (you can use dotted or dashed too)
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Container(
                          width: 190,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (const Text("AadhaarNumber")),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                        ),
                        child: Container(
                          width: 197,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (Text('text')),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                      style: BorderStyle
                          .solid, // Border style (you can use dotted or dashed too)
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Container(
                          width: 190,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (const Text("Verified")),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                        ),
                        child: Container(
                          width: 197,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (Text('text')),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                      style: BorderStyle
                          .solid, // Border style (you can use dotted or dashed too)
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Container(
                          width: 190,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (const Text("Password")),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                        ),
                        child: Container(
                          width: 197,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (Text('text')),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                      style: BorderStyle
                          .solid, // Border style (you can use dotted or dashed too)
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Container(
                          width: 190,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (const Text("LastName")),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                        ),
                        child: Container(
                          width: 197,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (Text('text')),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                      style: BorderStyle
                          .solid, // Border style (you can use dotted or dashed too)
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Container(
                          width: 190,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (const Text("District")),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                        ),
                        child: Container(
                          width: 197,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (Text('text')),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                      style: BorderStyle
                          .solid, // Border style (you can use dotted or dashed too)
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Container(
                          width: 190,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (const Text("PinCode")),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                        ),
                        child: Container(
                          width: 197,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (Text('text')),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                      style: BorderStyle
                          .solid, // Border style (you can use dotted or dashed too)
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Container(
                          width: 190,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (const Text("AadhaarUploaded")),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                        ),
                        child: Container(
                          width: 197,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                              style: BorderStyle
                                  .solid, // Border style (you can use dotted or dashed too)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 10),
                            child: (Text('text')),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
