import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,  // Purple text color
                ),
              ),
              SizedBox(height: 40),
              // Email Input Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.purple),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // Password Input Field
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.purple),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              // Forgot password link
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Handle Forgot Password
                  },
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Sign In
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.black,  // Set the text color to black
                      fontSize: 16.0,       // Adjust the font size if needed
                      fontWeight: FontWeight.bold,  // Optional: bold for better visibility
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,  // Button background color
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Sign up link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      // Navigate to Sign Up
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ],
              ),
              // Social media login buttons
              SizedBox(height: 10),
              Text('Sign In with', style: TextStyle(color: Colors.black54)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.facebook, color: Colors.blue),
                    onPressed: () {
                      // Handle Facebook login
                    },
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    icon: Icon(Icons.linked_camera, color: Colors.blueGrey),
                    onPressed: () {
                      // Handle LinkedIn login
                    },
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    icon: Icon(Icons.g_mobiledata, color: Colors.red),
                    onPressed: () {
                      // Handle Google login
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
