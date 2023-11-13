import 'dart:async';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter/material.dart';
import 'package:eco/auth/signin.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController userInputController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  bool isOtpSent = false;
  Timer? _resendTimer;
  int _remainingTime = 30; // 30 seconds

  void _resendOtp() {
    // Start the timer
    _startResendTimer();

    // Disable the button
    setState(() {
      isOtpSent = false;
    });
  }

  void _startResendTimer() {
    _remainingTime = 30; // Reset the timer to 30 seconds
    _resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _resendTimer?.cancel(); // Cancel the timer when it reaches 0
          _resendTimer = null;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'ForgotPassword',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 285, // Set the desired width
                          height: 80, // Set the desired height
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/EcoHex_Logo-removebg-preview.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: userInputController,
                          enabled: !isOtpSent,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Email/Mobile",
                          ),
                        ),
                        SizedBox(height: 20.0),
                        if (isOtpSent)
                          Text(
                            "OTP",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        SizedBox(
                          height: 10,
                        ),
                        if (isOtpSent)
                          TextFormField(
                            controller: otpController,
                            decoration: InputDecoration(
                              hintText: "Enter OTP",
                            ),
                          ),
                        SizedBox(height: 20.0),
                        Center(
                          child: ElevatedButton(
                            onPressed: isOtpSent
                                ? () {}
                                : () {
                                    // Start the timer when clicking the "Send OTP" button
                                    _startResendTimer();
                                    // Implement your OTP send logic here
                                    setState(() {
                                      isOtpSent = true;
                                    });
                                  },
                            child: Text(
                              isOtpSent ? "Verify OTP" : "Send OTP",
                              style: TextStyle(
                                fontSize: 20,
                                color:
                                    Colors.white, // Set the text color to white
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 112, 112, 205),
                              fixedSize: Size(650, 50),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SingIN(),
                                  ),
                                );
                              },
                              child: Text(
                                "Go To SignIn",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (isOtpSent && _resendTimer == null)
                          TextButton(
                            onPressed: _resendOtp,
                            child: Text(
                              "Resend OTP",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        if (isOtpSent && _resendTimer != null)
                          Text(
                            "Resend OTP in $_remainingTime seconds",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
