// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class assestsinfo extends StatefulWidget {
  const assestsinfo({Key? key}) : super(key: key);

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<assestsinfo> {
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
                            child: (const Text('NumberOfTrees')),
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
                            child: (const Text('LandExtent')),
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
                            child: (const Text('Height')),
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
                            child: (const Text('GreenWeight')),
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
                            child: (const Text('TotalCO2SequesteredPerTree')),
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
                            child: (const Text("TotalCarbonCredits")),
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
                            child: (const Text("UserId")),
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
                            child: (const Text("KathaNumber")),
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
                            child: (const Text("LandType")),
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
                            child: (const Text("SteamDiameter")),
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
                            child: (const Text("DryWeight")),
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
                            child: (const Text("TotalCO2Sequestered")),
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
                            child: (const Text("TotalCarbonCreditsPerYear")),
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
                            child: (const Text("AgeOfTheTree")),
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
                            child: (const Text("SurveyNumber")),
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
                            child: (const Text("GeoLocation")),
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
                            child: (const Text("GreenWeightAboveGround")),
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
                            child: (const Text("CarbonWeight")),
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
                            child: (const Text("TotalCO2SequesteredPerYear")),
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
                            child: (const Text("Co2Sequestered")),
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
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 10),
                child: Column(
                  children: [
                    Container(
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey, // Border color
                          width: 2.0, // Border width
                          style: BorderStyle
                              .solid, // Border style (you can use dotted or dashed too)
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Center(
                                child: Text(
                              'Tree Images',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
