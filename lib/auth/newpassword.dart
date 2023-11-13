import 'package:flutter/material.dart';
import 'package:eco/auth/signin.dart';

class NewPasswordPage extends StatefulWidget {
  final String id;

  const NewPasswordPage({super.key, required this.id});

  @override
  _NewPasswordPageState createState() => _NewPasswordPageState(id: id);
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final String id;

  _NewPasswordPageState({required this.id});
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'New Password',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: newPasswordController,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Enter New Password",
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: confirmNewPasswordController,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          // Implement your password update logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 112, 112, 205),
                          fixedSize: const Size(650, 60),
                        ),
                        child: Text(
                          "Update Password",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
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
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
