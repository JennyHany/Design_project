import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/soret l tagroba.jpg"),
            fit: BoxFit.cover, // Full background image
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 60), // Moves text to the top
              const Text(
                'Create your new \naccount',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white, // Changed to white
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Create an account to start looking for the food you like',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16.0,
                  color: Colors.white70, // Changed to white70
                ),
              ),
              const SizedBox(height: 30.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
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
                          numericCharCount: 3,
                          specialCharCount: 1,
                          width: 400,
                          height: 150,
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
                        const SizedBox(height: 15.0),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white, // White button
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate() && isPassCorrect) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Processing Data')),
                                );
                                Navigator.pushNamed(context, '/signin');
                              }
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                color: Color(0xff8E22D2), // Purple text
                                fontSize: 20.0, fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        const Text(
                          'Or sign in with',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.g_mobiledata, size: 49, color: Colors.red),
                            SizedBox(width: 20),
                            Icon(Icons.facebook, size: 35, color: Colors.blue),
                            SizedBox(width: 20),
                            Icon(Icons.apple, size: 35, color: Colors.black),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?", style: TextStyle(color: Colors.white, fontSize: 18)),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/signin');
                              },
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Color(0xff8E22D2),
                                  fontSize: 19
                                ),
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
