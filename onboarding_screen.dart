import 'package:design_project_homepage/widgets/onboarding_card.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>{
  static final PageController _pageController = PageController(initialPage:0);

  @override
  Widget build(BuildContext context) {
    List<Widget> _onBoardingScreens = [
      OnboardingCard(
        image: "assets/screen3.2.png",
        title: "Don't know what to eat?",
        description: "",
        buttonText: "Next",
        onPressed: () {
          _pageController.animateToPage(
              1, duration: Durations.long1, curve: Curves.linear);
        },
      ),
      OnboardingCard(
        image: "assets/screen2.1.png",
        title: "Diverse and fresh food",
        description: "Take a look at all the options we have for you!",
        buttonText: "Next",
        onPressed: () {
          _pageController.animateToPage(
              2, duration: Durations.long1, curve: Curves.linear);
        },
      ),
      OnboardingCard(
        image: "assets/loc.png",
        title: "Delivered to your exact location",
        description: "Everything you need in one application!",
        buttonText: "Sign up now",
        onPressed: () {
          Navigator.pushNamed(context, '/signup'); // Navigate to sign-up page
        },
      ),

    ];

      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SmoothPageIndicator at the top of the page
              SmoothPageIndicator(
                controller: _pageController,
                count: _onBoardingScreens.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.red[400]!,
                  dotColor: Colors.red[200]!,
                  dotWidth: 50.0,
                  // Increases dot width for a longer appearance
                  dotHeight: 6.0,
                  // Sets dot height for a thinner appearance
                  expansionFactor: 2.5,
                ),
                onDotClicked: (index) {
                  _pageController.animateToPage(
                      index, duration: Durations.long1, curve: Curves.linear);
                },
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: _onBoardingScreens,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
