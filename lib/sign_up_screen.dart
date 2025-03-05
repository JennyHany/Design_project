import 'dart:io';
import 'package:design_project_homepage/user_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final passCreate = TextEditingController();
  bool isPassCorrect = false;
  File? _image; // Store selected image
  bool _isImageValid = true;
  final emailtext = TextEditingController(); // To track image validation
  final uname = TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _isImageValid = true; // Reset error when an image is selected
      });
    }
  }

  void _validateAndSubmit() {
    setState(() {
      _isImageValid = _image != null; // Validate image
    });

    if (_formKey.currentState!.validate() && isPassCorrect && _image != null) {
      String email = emailtext.text;
      String username = uname.text;
      String password = passCreate.text;

      // Save user data in provider
      Provider.of<UserProvider>(context, listen: false).setUserData(
        email: email,
        username: username,
        password: password,
        image: _image!, phone: '',
      );

      // Navigate to Main Page
      Navigator.pushNamed(context, '/foodHome');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/soret l tagroba.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 60),
              const Text(
                'Create your new \naccount',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 7),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => _pickImage(ImageSource.gallery),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    _image != null ? FileImage(_image!) : null,
                                child: _image == null
                                    ? const Icon(Icons.camera_alt,
                                        size: 40, color: Colors.black54)
                                    : null,
                              ),
                              if (!_isImageValid)
                                const Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    'Photo is required',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 14),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        TextFormField(
                          controller: emailtext,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Field cannot be empty';
                            }
                            if (!EmailValidator.validate(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Email',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        TextFormField(
                          controller: uname,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Field cannot be empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Username',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        TextFormField(
                          controller: passCreate,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black54,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        FlutterPwValidator(
                          controller: passCreate,
                          minLength: 6,
                          uppercaseCharCount: 1,
                          numericCharCount: 1,
                          width: 400,
                          height: 120,
                          onSuccess: () {
                            setState(() {
                              isPassCorrect = true;
                            });
                          },
                          onFail: () {
                            setState(() {
                              isPassCorrect = false;
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            onPressed: _validateAndSubmit,
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                  color: Color(0xff8E22D2),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        const Text(
                          'Or sign in with',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        const SizedBox(height: 15),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.g_mobiledata,
                                size: 55, color: Colors.red),
                            SizedBox(width: 10),
                            Icon(Icons.facebook, size: 35, color: Colors.blue),
                            SizedBox(width: 20),
                            Icon(Icons.apple, size: 35, color: Colors.black),
                          ],
                        ),
                        // const SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/signin');
                              },
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Color(0xff8E22D2), fontSize: 19),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
