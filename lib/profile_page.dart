import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: TextButton(
          onPressed: () { Navigator.pop(context);},
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150'), // Replace with your image URL
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.camera_alt,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              buildTextField('YOUR EMAIL', 'maysasha@gmail.com'),
              const SizedBox(height: 20),
              buildTextField('YOUR PASSWORD', '•••••••••••', isObscured: true),
              const SizedBox(height: 20),
              buildTextField('YOUR PHONE', '+1.415.111.0000'),
              const SizedBox(height: 20),
              buildTextField('CITY, STATE', 'San Francisco, CA'),
              const SizedBox(height: 20),
              buildTextField('COUNTRY', 'USA'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, String value, {bool isObscured = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isObscured,
          readOnly: true,
          decoration: InputDecoration(
            hintText: value,
            hintStyle: const TextStyle(fontSize: 16, color: Colors.black),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfilePage(),
  ));
}