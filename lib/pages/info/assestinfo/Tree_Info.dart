// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, unused_element, sort_child_properties_last

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http_parser/http_parser.dart' show MediaType;
import 'package:geolocator/geolocator.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_dialogs/material_dialogs.dart';

class TreeInfo extends StatefulWidget {
  final String treeId;

  TreeInfo(this.treeId, {Key? key}) : super(key: key);

  @override
  _TreeInfoState createState() => _TreeInfoState();
}

class _TreeInfoState extends State<TreeInfo> {
  late Future<Map<String, dynamic>> treeInfo;
  late Future<List<Map<String, dynamic>>> treeImages;
  File? _selectedImage;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    treeInfo = fetchTreeInfo();
    treeImages = fetchTreeImages();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<Map<String, dynamic>> fetchTreeInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwtToken = prefs.getString('jwt_token');
    if (jwtToken == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Token was not Fount . Please try again later.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
    try {
      final response = await http.get(
        Uri.parse('https://api.ecohex.in/tree/getTree/${widget.treeId}'),
        headers: {
          "Authorization": "Bearer $jwtToken",
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print(
            'API Response (Error): ${response.statusCode} - ${response.body}');
        throw Exception('Failed to load tree info');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load tree info');
    }
  }

  Future<List<Map<String, dynamic>>> fetchTreeImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwtToken = prefs.getString('jwt_token');
    if (jwtToken == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Token was not Fount . Please try again later.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
    try {
      final response = await http.get(
        Uri.parse('https://api.ecohex.in/image/get/${widget.treeId}'),
        headers: {
          "Authorization": "Bearer $jwtToken",
        },
      );

      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(json.decode(response.body));
      } else {
        print(
            'API Response (Error): ${response.statusCode} - ${response.body}');
        throw Exception('Failed to load tree images');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load tree images');
    }
  }

  // Function to upload image to the server
  Future<void> _uploadImage(File image) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwtToken = prefs.getString('jwt_token');

    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          // Handle the case where the user denies location permission
          print('User denied permissions to access the device\'s location.');

          // You can display a message to the user or navigate to app settings
          // Example:
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text('Location permission is required to upload an image.'),
          //   ),
          // );

          // Alternatively, you can redirect the user to the app settings
          // Example:
          // Geolocator.openAppSettings();

          return;
        }
      }

      final request = http.MultipartRequest(
        'POST',
        Uri.parse('https://api.ecohex.in/image/upload'),
      );

      request.headers["Authorization"] = "Bearer $jwtToken";
      request.fields["treeId"] = widget.treeId;

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      request.fields["latitude"] = position.latitude.toString();
      request.fields["longitude"] = position.longitude.toString();

      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          image.path,
          contentType: MediaType('image', 'jpeg'),
        ),
      );

      final response = await request.send();

      if (response.statusCode == 202) {
        // Request accepted, but response might be empty
        print('Image upload accepted, processing...');
        print('Response: ${await response.stream.bytesToString()}');
      } else if (response.statusCode == 200) {
        // Image uploaded successfully
        print('Image uploaded successfully');
      } else {
        print(
            'Image upload failed: ${response.statusCode} - ${response.reasonPhrase}');
        // Print the response body for more details
        print('Response: ${await response.stream.bytesToString()}');
        // Handle error
      }
    } catch (e) {
      print('Error uploading image: $e');
      // Handle error
    }
  }

  Future<void> _showImageSourceDialog() async {
    return Dialogs.bottomMaterialDialog(
        msg: 'Select Image Source',
        title: "Upload Tree Image",
        color: Colors.white,
        context: context,
        actions: [
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Column(
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _pickImage();
                    },
                    child: Icon(
                      Icons.camera_enhance,
                      size: 45,
                      color: Colors.orange,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Take a Photo',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.035),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              Column(
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _pickImagefromgallary();
                    },
                    child: Icon(
                      Icons.image_outlined,
                      size: 45,
                      color: Colors.purple,
                    ),
                  ),
                  Container(
                    child: Text('Select from Gallary',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.width * 0.035)),
                  )
                ],
              )
            ],
          )
        ]);
  }

  Future<void> _showImagePreviewDialog(File imageFile) async {
    Dialogs.materialDialog(
        msg: 'Image Preview',
        title: "Upload Tree Image",
        color: Colors.white,
        context: context,
        actions: [
          Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.file(_selectedImage!)),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                children: [
                  Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.27,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(7)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.width * 0.032,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Clear',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.032,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.27,
                        decoration: BoxDecoration(
                            // color: Colors.red,
                            border: Border.all(
                                color: Colors.green, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(7)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.upload,
                              color: Colors.green,
                              size: MediaQuery.of(context).size.width * 0.035,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'upload',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.035,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      )
                      // OutlinedButton(
                      //     onPressed: () {
                      //       Navigator.of(context).pop(); // Close the dialog
                      //       _uploadImage(imageFile);
                      //     },

                      //     style: OutlinedButton.styleFrom(
                      //         side: BorderSide(color: Colors.green),
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(10)))),
                    ],
                  )
                ],
              ),
            ],
          )
        ]);
  }

  Future _pickImagefromgallary() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked == null) return;
    setState(() {
      _selectedImage = File(picked.path);
      _showImagePreviewDialog(_selectedImage!);
    });
  }

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.camera);
    if (picked == null) return;
    setState(() {
      _selectedImage = File(picked.path);
      _showImagePreviewDialog(_selectedImage!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,

        iconTheme: IconThemeData(
            // color: Colors.white,
            ),
        // flexibleSpace: Container(
        //   decoration: BoxDecoration(color: Colors.transparent
        //       // gradient: LinearGradient(
        //       //   begin: Alignment.topLeft,
        //       //   end: Alignment.bottomRight,
        //       //   colors: [Colors.teal, Colors.blue],
        //       // ),
        //       ),
        // ),
        title: const Text(
          'Tree Info',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            // color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: treeInfo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            Map<String, dynamic> treeData = snapshot.data!;
            return FutureBuilder<List<Map<String, dynamic>>>(
              future: treeImages,
              builder: (context, imageSnapshot) {
                if (imageSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (imageSnapshot.hasError) {
                  return Center(child: Text('Error: ${imageSnapshot.error}'));
                } else {
                  final images = imageSnapshot.data!;

                  return Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Scrollbar(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              UserInfoRow(
                                label: 'ID',
                                value: treeData['id'].toString(),
                                gradientColors: [Colors.blue, Colors.teal],
                              ),
                              UserInfoRow(
                                label: 'userId',
                                value: treeData['userId'].toString(),
                                gradientColors: [Colors.blue, Colors.teal],
                              ),
                              UserInfoRow(
                                label: 'ageOfTheTree',
                                value: treeData['ageOfTheTree'].toString(),
                                gradientColors: [Colors.blue, Colors.teal],
                              ),
                              UserInfoRow(
                                  label: 'kathaNumber',
                                  value: treeData['kathaNumber'].toString(),
                                  gradientColors: [Colors.blue, Colors.teal]),
                              UserInfoRow(
                                  label: 'surveyNumber',
                                  value: treeData['surveyNumber'].toString(),
                                  gradientColors: [Colors.blue, Colors.teal]),
                              UserInfoRow(
                                  label: 'landExtent',
                                  value: treeData['landExtent'].toString(),
                                  gradientColors: [Colors.blue, Colors.teal]),
                              UserInfoRow(
                                  label: 'landType',
                                  value: treeData['landType'].toString(),
                                  gradientColors: [Colors.blue, Colors.teal]),
                              UserInfoRow(
                                  label: 'geoLocation',
                                  value: treeData['geoLocation'].toString(),
                                  gradientColors: [Colors.blue, Colors.teal]),
                              UserInfoRow(
                                  label: 'height',
                                  value: treeData['height'].toString(),
                                  gradientColors: [Colors.blue, Colors.teal]),
                              UserInfoRow(
                                  label: 'steamDiameter',
                                  value: treeData['steamDiameter'].toString(),
                                  gradientColors: [Colors.blue, Colors.teal]),
                              UserInfoRow(
                                  label: 'greenWeightAboveGround',
                                  value: treeData['greenWeightAboveGround']
                                      .toString(),
                                  gradientColors: [Colors.blue, Colors.teal]),
                              UserInfoRow(
                                  label: 'greenWeight',
                                  value: treeData['greenWeight'].toString(),
                                  gradientColors: [Colors.blue, Colors.teal]),
                              UserInfoRow(
                                  label: 'dryWeight',
                                  value: treeData['dryWeight'].toString(),
                                  gradientColors: [Colors.blue, Colors.teal]),
                              UserInfoRow(
                                  label: 'carbonWeight',
                                  value: treeData['carbonWeight'].toString(),
                                  gradientColors: [Colors.blue, Colors.teal]),
                              UserInfoRow(
                                  label: 'totalCO2SequesteredPerTree',
                                  value: treeData['totalCO2SequesteredPerTree']
                                      .toString(),
                                  gradientColors: [Colors.blue, Colors.teal]),
                              UserInfoRow(
                                  label: 'totalCO2Sequestered',
                                  value: treeData['totalCO2Sequestered']
                                      .toString(),
                                  gradientColors: [Colors.blue, Colors.teal]),
                              UserInfoRow(
                                  label: 'totalCO2SequesteredPerYear',
                                  value: treeData['totalCO2SequesteredPerYear']
                                      .toString(),
                                  gradientColors: [Colors.blue, Colors.teal]),
                              UserInfoRow(
                                  label: 'totalCarbonCredits',
                                  value:
                                      treeData['totalCarbonCredits'].toString(),
                                  gradientColors: [Colors.blue, Colors.teal]),
                              UserInfoRow(
                                  label: 'totalCarbonCreditsPerYear',
                                  value: treeData['totalCarbonCreditsPerYear']
                                      .toString(),
                                  gradientColors: [Colors.blue, Colors.teal]),
                              UserInfoRow(
                                  label: 'co2Sequestered',
                                  value: treeData['co2Sequestered'].toString(),
                                  gradientColors: [Colors.blue, Colors.teal]),
                              SizedBox(height: 20),
                              Center(
                                child: Text(
                                  'Tree Images',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: PageView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: images.length,
                                  itemBuilder: (context, index) {
                                    final image = images[index];
                                    final imageFile = Image.memory(
                                      base64Decode(image['file']),
                                      height: 180,
                                      width: 380,
                                    );
                                    return Stack(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ImageFullScreen(
                                                  imageUrls: List<String>.from(
                                                      images.map((image) =>
                                                          image['file']
                                                              as String)),
                                                  initialIndex: index,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(18.0),
                                                child: imageFile,
                                              ),
                                              Text('Location: ${image['latitude'] ?? 'N/A'}' +
                                                  ' ,${image['longitude'] ?? 'N/A'}'),
                                              Text(
                                                  'Time: ${image['date'] ?? 'N/A'} '),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          left: -18,
                                          top:
                                              85, // Adjust the position as needed
                                          child: IconButton(
                                            icon: Icon(Icons.chevron_left),
                                            onPressed: () {
                                              // Navigate to the previous image
                                              if (index > 0) {
                                                // Check if it's not the first image
                                                _pageController.previousPage(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.ease,
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                        Positioned(
                                          right: -18,
                                          top:
                                              85, // Adjust the position as needed
                                          child: IconButton(
                                            icon: Icon(Icons.chevron_right),
                                            onPressed: () {
                                              // Navigate to the next image
                                              if (index < images.length - 1) {
                                                // Check if it's not the last image
                                                _pageController.nextPage(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.ease,
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  controller: _pageController,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        // onPressed: _pickImage,
        onPressed: _showImageSourceDialog,
        elevation: 10,
        tooltip: 'Upload Image',
        // foregroundColor: Colors.white,
        // backgroundColor: Colors.blue,
        label: const Text('Upload Image'),
        icon: Icon(Icons.file_upload),
      ),
    );
  }
}

class UserInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final List<Color> gradientColors;

  const UserInfoRow({
    Key? key,
    required this.label,
    required this.value,
    required this.gradientColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 14.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
// image_full_screen.dart

class ImageFullScreen extends StatefulWidget {
  final List<String> imageUrls;
  final int initialIndex;

  const ImageFullScreen({
    Key? key,
    required this.imageUrls,
    required this.initialIndex,
  }) : super(key: key);

  @override
  _ImageFullScreenState createState() => _ImageFullScreenState();
}

class _ImageFullScreenState extends State<ImageFullScreen> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  void _goToPreviousImage() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  void _goToNextImage() {
    if (currentIndex < widget.imageUrls.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Preview'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.memory(
                _decodeImage(widget.imageUrls[currentIndex]),
                fit: BoxFit.contain,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: _goToPreviousImage,
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: _goToNextImage,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Uint8List _decodeImage(String imageUrl) {
    try {
      return base64Decode(imageUrl);
    } catch (e) {
      print("Error decoding image: $e");
      return Uint8List(0);
    }
  }
}
