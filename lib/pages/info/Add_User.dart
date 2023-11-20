import 'package:flutter/material.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final _formKey = GlobalKey<FormState>();
  final _controllers = <TextEditingController>[];

  @override
  void initState() {
    super.initState();
    _controllers.addAll(List.generate(15, (_) => TextEditingController()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add User',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField('Mobile Number', _controllers[0]),
              _buildTextField('First Name', _controllers[1]),
              _buildTextField('Last Name', _controllers[2]),
              _buildTextField('Email Id', _controllers[3]),
              _buildTextField('PIN', _controllers[4]),
              _buildTextField('Role', _controllers[5]),
              _buildTextField('Preferred Language', _controllers[6]),
              _buildTextField('Address Line 1', _controllers[7]),
              _buildTextField('Address Line 2', _controllers[8]),
              _buildTextField('Address Line 3', _controllers[9]),
              _buildTextField('State', _controllers[10]),
              _buildTextField('District', _controllers[11]),
              _buildTextField('Zone', _controllers[12]),
              _buildTextField('City', _controllers[13]),
              _buildTextField('Landmark', _controllers[14]),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process the form data
                    // Your logic here
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: Text('Add User'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: AddUserPage(),
    ),
  );
}
