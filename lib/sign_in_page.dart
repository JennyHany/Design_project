import 'package:flutter/material.dart';
import 'forgot_password_page.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            children: [
              const SizedBox(height: 60), // Moves text to the top
              const Text(
                "Login to your \naccount.",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                  height: 1.25,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Please sign in to your account",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 24),
              const Text("Email Address",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text("Password",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              const SizedBox(height: 8),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: const Icon(Icons.visibility_off, color: Colors.black54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                    );
                  },
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.white,fontSize: 16), // Changed to white
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/foodHome');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Changed button to white
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(color: Color(0xff8E22D2), fontSize: 21,fontWeight: FontWeight.bold), // Purple text
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Center(
                child: Text(
                  'Or sign in with',
                  style: TextStyle(color: Colors.white,fontSize: 15),
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.g_mobiledata, size: 40, color: Colors.red),
                  SizedBox(width: 20),
                  Icon(Icons.facebook, size: 40, color: Colors.blue),
                  SizedBox(width: 20),
                  Icon(Icons.apple, size: 40, color: Colors.black),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?", style: TextStyle(color: Colors.white,fontSize: 18)),
                  TextButton(
                    onPressed: () {Navigator.pushNamed(context, '/signup');},
                    child: const Text("Register", style: TextStyle(color: Color(0xffB966EE),fontSize: 18)),
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
