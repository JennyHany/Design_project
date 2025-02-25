import 'package:flutter/material.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  List<TextEditingController> otpControllers =
  List.generate(4, (index) => TextEditingController());
  int _counter = 90; // 90 seconds countdown
  bool _isResendActive = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
        _startTimer();
      } else {
        setState(() {
          _isResendActive = true;
        });
      }
    });
  }

  Widget _otpBox(TextEditingController controller) {
    return SizedBox(
      width: 70,  //adjust border size
      height: 70,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xff8E22D2)),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              IconButton(
                icon: const Icon(Icons.arrow_back, size: 24),
                onPressed: () => Navigator.pop(context),
              ),
              //const SizedBox(height: 20),

              const SizedBox(height: 10),
              const Text(
                "Email verification",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Enter the verification code we sent you on: Alberts******@gmail.com",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: otpControllers.map((controller) => _otpBox(controller)).toList(),
              ),
              const SizedBox(height: 15),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn’t receive code? ",
                      style: TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: _isResendActive
                          ? () {
                        setState(() {
                          _counter = 90;
                          _isResendActive = false;
                          _startTimer();
                        });
                      }
                          : null,
                      child: Text(
                        "Resend",
                        style: TextStyle(
                          fontSize: 17,
                          color: _isResendActive ? Color(0xffB966EE) : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.access_time, size: 22, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text(
                      "0${_counter ~/ 60}:${_counter % 60 < 10 ? '0' : ''}${_counter % 60}",
                      style: const TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff8E22D2),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    String otpCode = otpControllers.map((e) => e.text).join();
                    if (otpCode.length == 4) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("OTP Verified!")),
                      );
                      Navigator.pushNamed(context, '/reset-password');

                    }
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
