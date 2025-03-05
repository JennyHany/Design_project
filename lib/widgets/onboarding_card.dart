import 'package:flutter/material.dart';

class OnboardingCard extends StatelessWidget {
  final String image, title, description, buttonText;
  final Function onPressed;
  final bool textAbove; // New parameter to control text position

  const OnboardingCard({
  super.key,
  required this.image,
  required this.title,
  required this.description,
  required this.buttonText,
  required this.onPressed,
  this.textAbove = false, // Default is false (text below image)
 });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF100425), // Background color
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Keeps button at bottom
          children: [
            const SizedBox(height: 30), // Spacer at top
            if (textAbove) _buildText(), // Text above image if true
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
            if (!textAbove) _buildText(), // Text below image if false
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: MaterialButton(
                onPressed: () => onPressed(),
                color: Colors.deepPurple[400]!,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                minWidth: 100,
                height: 40,
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildText() {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: 'Trajan',
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w700,
              fontFamily: 'Trajan',
            ),
          ),
        ),
      ],
    );
  }
}
