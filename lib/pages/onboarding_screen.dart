import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../sign_up_screen.dart';
import '../widgets/onboarding_card.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    List<Widget> _onBoardingScreens = [
      Stack(
        children: [
          OnboardingCard(
            image: "assets/images/sc11.png",
            title: "", // Remove title from here
            description: "",
            buttonText: "Next",
            textAbove: true,
            onPressed: () {
              _pageController.animateToPage(1, duration: Durations.long1, curve: Curves.linear);
            },
          ),
          Positioned(
            top: 100, // Adjust as needed
            left: 0,
            right: 0,
            child: Text(
              "Don't know what to eat?",
              style: TextStyle(color: Colors.white,fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Trajan',),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      OnboardingCard(
        image: "assets/images/sc22.png",
        title: "All your favorites in one place!",
        description: "\n Discover a variety of delicious options just for you",
        buttonText: "Next",
        onPressed: () {
          _pageController.animateToPage(2, duration: Durations.long1, curve: Curves.linear);
        },
      ),
      OnboardingCard(
        image: "assets/images/sc33.png",
        title: "Good food within minutes!",
        description: "\n Delivered to your exact location",
        buttonText: "Sign up now",
        onPressed: () {
          Navigator.pushNamed(context, '/signup');
        },
      ),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: _pageController,
            children: _onBoardingScreens,
          ),
          Positioned(
            bottom: 30,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: _onBoardingScreens.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.deepPurple[300]!,
                dotColor: Colors.grey,
                dotWidth: 10.0,
                dotHeight: 10.0,
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

