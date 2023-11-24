// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditDetails extends StatefulWidget {
  final String UserId;

  EditDetails({required this.UserId, Key? key}) : super(key: key);
  @override
  _EditDetailsState createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  // Define user details
  String ID = "";
  String Email = "";
  String Password = "";
  String Name = "";
  String FirstName = "";
  String LastName = "";
  String LandType = "";

  String address1 = "";
  String address2 = "";

  String district = "";
  String state = "";
  String Country = "";
  String pincode = "";
  String Role = "";
  String AadhaarNumber = "";
  String AadhaarUploaded = "";
  String KhataBookUploaded = "";
  String Verified = "";

  // Controller for the editable text fields
  final TextEditingController IdController = TextEditingController();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController NameController = TextEditingController();
  final TextEditingController FirstNameController = TextEditingController();

  final TextEditingController LastnameController = TextEditingController();
  final TextEditingController LandTypeController = TextEditingController();

  final TextEditingController Address1Controller = TextEditingController();
  final TextEditingController Address2Controller = TextEditingController();

  final TextEditingController DistrictController = TextEditingController();
  final TextEditingController StateController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController CountryController = TextEditingController();

  final TextEditingController RolecodeController = TextEditingController();
  final TextEditingController AadhaarNumberController = TextEditingController();
  final TextEditingController AadhaarUploadedController =
      TextEditingController();
  final TextEditingController KataBookUploadedController =
      TextEditingController();
  final TextEditingController VerifiedController = TextEditingController();

  bool isEditing = false;
  List<String> editingdeviceIds = [];
  @override
  void initState() {
    super.initState();
    // Fetch user details from the API
    // fetchUserDetails();
  }

  // Function to fetch user details from the API
  // Future<void> fetchUserDetails() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? jwtToken = prefs.getString('jwt_token');

  //   if (jwtToken == null) {
  //     // Handle the case where the token is not found
  //     // return null;
  //   }
  //   final response = await http.get(
  //     Uri.https('console-api.theja.in', '/admin/getUser/${widget.mobileId}'),
  //     headers: {
  //       "Authorization": "Bearer $jwtToken",
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     final userData = json.decode(response.body);
  //     print(response.body);

  //     setState(() {
  //       ID = userData['userDetails']['name'] ?? 'N/A';
  //       Email = userData['userDetails']['firstName'];
  //       // lastname = userData['userDetails']['lastName'];
  //       // mobileNumber = userData['mobile'];
  //       // email = userData['email'] ?? 'N/A';
  //       // role = userData['role'];
  //       // status = userData['active'] ? 'Active' : 'Inactive';
  //       // pin = userData['pin'] ?? 'N/A';
  //       // language = userData['preferredLanguage'];
  //       // zone = userData['zone'];
  //       // subscriptionValid = userData['subscriptionValidity'];
  //       // final addressData = userData['userDetails']['address'];
  //       // address1 = '${addressData['addressLine1']},';
  //       // address2 = '${addressData['addressLine2']}';
  //       // address3 = '${addressData['addressLine3']}';
  //       // landmark = '${addressData['landMark']}';
  //       // city = '${addressData['city']}';
  //       // state = '${addressData['state']}';
  //       // district = '${addressData['district']}';
  //       // pincode = '${addressData['pinCode']}';
  //       // deviceIds =
  //       //     (userData['deviceIds'] as List).map((id) => id.toString()).toList();

  //       // Initialize the controllers with the fetched user details
  //       nameController.text = name;
  //       firstnameController.text = firstname;
  //       lastnameController.text = lastname;
  //       mobileNumberController.text = mobileNumber;
  //       // emailController.text = email;
  //       // roleController.text = role;
  //       // statusController.text = status;
  //       // pinController.text = pin;
  //       // languageController.text = language;
  //       // zoneController.text = zone;
  //       // subscriptionValidController.text = subscriptionValid;
  //       // address1Controller.text = address1;
  //       // address2Controller.text = address2;
  //       // address3Controller.text = address3;
  //       // landmarkController.text = landmark;
  //       // cityController.text = city;
  //       // districtController.text = district;
  //       // stateController.text = state;
  //       // pincodeController.text = pincode;
  //     });
  //   } else {
  //     // Handle the error when the API request fails
  //     print('Failed to fetch user details');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffcbcbcb),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('user_deatils'.tr),
        actions: [
          isEditing
              ? IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () {
                    // Save the edited user details here
                    setState(() {
                      ID = IdController.text;
                      Email = EmailController.text;
                      FirstName = FirstNameController.text;
                      LastName = LandTypeController.text;
                      LandType = LandTypeController.text;
                      address1 = Address1Controller.text;
                      address2 = Address2Controller.text;
                      district = DistrictController.text;
                      state = StateController.text;
                      Country = CountryController.text;
                      pincode = pincodeController.text;
                      Role = RolecodeController.text;
                      KhataBookUploaded = KataBookUploadedController.text;
                      isEditing = false;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      isEditing = true;
                      // editingdeviceIds = List<String>.from(deviceIds);
                    });
                  },
                ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _buildUserDetail("Name".tr, NameController),

            _buildUserDetail("Email_id".tr, EmailController),

            _buildUserDetail("Password".tr, PasswordController),

            _buildUserDetail("Name".tr, NameController),

            _buildUserDetail("FirstName".tr, FirstNameController),

            _buildUserDetail("LastName".tr, LastnameController),

            _buildUserDetail("LandType".tr, LandTypeController),

            _buildUserDetail("Address1".tr, Address1Controller),

            _buildUserDetail("Address2".tr, Address2Controller),

            _buildUserDetail("District".tr, DistrictController),

            _buildUserDetail("State".tr, StateController),
            _buildUserDetail("Country".tr, CountryController),
            _buildUserDetail("PinCode".tr, pincodeController),
            _buildUserDetail("Role".tr, RolecodeController),
            _buildUserDetail("AadhaarNumber".tr, AadhaarNumberController),
            _buildUserDetail("AadhaarUploaded".tr, AadhaarUploadedController),
            _buildUserDetail("KhataBookUploaded".tr, EmailController),
            _buildUserDetail("Verifed".tr, EmailController),

            // _buildUserDetail("role".tr, roleController),

            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildUserDetail(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 15, right: 10),
      child: Container(
        width: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.teal.withOpacity(0.2),
              Colors.blue,
            ],
          ),
          // border: Border.all(
          //   color: Colors.black, // Border color
          //   width: 1.0, // Border width
          //   style: BorderStyle
          //       .solid, // Border style (you can use dotted or dashed too)
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              isEditing
                  ? TextField(
                      controller: controller,
                    )
                  : Text(
                      controller.text,
                      style: TextStyle(fontSize: 16.0),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _UserDetail(
  //     String label, TextEditingController controller, bool editable) {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 10, top: 15, right: 10),
  //     child: Container(
  //       width: 380,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         gradient: LinearGradient(
  //           begin: Alignment.topLeft,
  //           end: Alignment.bottomRight,
  //           colors: [
  //             Colors.teal.withOpacity(0.2),
  //             Colors.blue,
  //           ],
  //         ),
  //         // border: Border.all(
  //         //   color: Colors.black, // Border color
  //         //   width: 1.0, // Border width
  //         //   style: BorderStyle.solid, // Border style
  //         // ),
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               label,
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             editable
  //                 ? TextField(
  //                     controller: controller,
  //                   )
  //                 : Text(
  //                     controller.text,
  //                     style: TextStyle(fontSize: 16.0),
  //                   ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
