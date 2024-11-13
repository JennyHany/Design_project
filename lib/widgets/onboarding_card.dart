import 'package:flutter/material.dart';

class OnboardingCard extends StatelessWidget {
  final String image, title, description, buttonText;
  final Function onPressed;
  const OnboardingCard({
  super.key,
  required this.image,
  required this.title,
  required this.description,
  required this.buttonText,
  required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
            Column(children:[
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[400], // Fill color
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Oswald',
                    )
                ),
              )
            ],
            ),
            MaterialButton(
              onPressed: () => onPressed(),
              color: Colors.red[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // Optional: rounded corners
              ),
              minWidth: 250,  // Set the minimum width to make it longer horizontally
              height: 50,     // Set the height to adjust the vertical size
              padding: EdgeInsets.symmetric(horizontal: 0.0),  // Add horizontal padding for more width
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            )

          ],
        )
    );
  }
}