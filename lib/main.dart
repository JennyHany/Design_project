import 'package:design_project_homepage/personal_data_screen.dart';
import 'package:design_project_homepage/profile_page.dart';
import 'package:design_project_homepage/reset_pass_screen.dart';
import 'package:design_project_homepage/shopping_cart_page.dart';
import 'package:design_project_homepage/sign_in_page.dart';
import 'package:design_project_homepage/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'food_item.dart';
import 'food_detail_page.dart'; // Import the FoodDetailPage
import 'otp_screen.dart';
import 'pages/onboarding_screen.dart';
import 'pages/splash.dart';
import 'sign_up_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: FoodApp(),
    ),
  );
}

class FoodApp extends StatefulWidget {
  @override
  State<FoodApp> createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      routes: {
        '/': (context) => Splash(),
        '/obs': (context) => const OnboardingScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/signin': (context) => SignInPage(),
        '/foodHome': (context) => FoodHomePage(),
        '/otp': (context) => const OTPVerificationScreen(),
        '/reset-password': (context) => const ResetPasswordScreen(),
        '/profilepage': (context) => ProfilePage(),
        '/personaldata': (context) => PersonalDataScreen(),
      },
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FoodHomePage extends StatefulWidget {
  @override
  State<FoodHomePage> createState() => _FoodHomePageState();
}

class _FoodHomePageState extends State<FoodHomePage> {
  int currentPageIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';

  Widget _foodVariantCard(String name, String description, double price, String imageUrl) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(imageUrl, height: 70, width: 70, fit: BoxFit.cover),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(description),
                  Text('\$${price.toStringAsFixed(2)}', style: const TextStyle(color: Colors.green)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget verticalFoodVariantList(List<FoodItem> items) {
    if (items.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("No matching items found."),
      );
    }


    return Column(
      children: items.map((item) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodDetailPage(foodItem: item),
              ),
            );
          },
          child: _foodVariantCard(
            item.name,
            item.description,
            item.price,
            item.imageUrl,
          ),
        );
      }).toList(),
    );
  }


  final PageController _pageController = PageController();

  void navigateToPage(int index) {
    setState(() {
      currentPageIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CartScreen()),
      ).then((_) {
        setState(() {
          currentPageIndex = 0;
        });
      });
    }

    if (index == 2) {
      Navigator.pushNamed(context, '/profilepage').then((_) {
        setState(() {
          currentPageIndex = 0;
        });
      });
    }
  }

  final List<FoodItem> mainCourseItems = [
    FoodItem(
      name: 'Appetizers',
      imageUrl: 'assets/app1.png',
      description: 'Start Your Meal with a Flavorful Kick!',
      price: 9,
    ),
    FoodItem(
      name: 'Pizza',
      imageUrl: 'assets/pizza2.png',
      description: 'Delicious cheesy pizza with toppings',
      price: 9.99,
    ),
    FoodItem(
      name: 'Burger',
      imageUrl: 'assets/burger1.png',
      description: 'Juicy beef burger with fresh lettuce',
      price: 8.99,
    ),
    FoodItem(
      name: 'Chicken',
      imageUrl: 'assets/chicken1.png',
      description: 'Grilled chicken served with spices',
      price: 10.99,
    ),
    FoodItem(
      name: 'Steak',
      imageUrl: 'assets/meat1.png',
      description: 'Tender steak cooked to perfection',
      price: 15.99,
    ),
    FoodItem(
      name: 'Ham',
      imageUrl: 'assets/ham1.png',
      description: 'Smoked ham with a savory flavor',
      price: 12.99,
    ),
    FoodItem(
      name: 'Sushi',
      imageUrl: 'assets/sushi1.png',
      description: 'Fresh sushi rolls with fish and vegetables',
      price: 14.99,
    ),
    FoodItem(
      name: 'Seafood',
      imageUrl: 'assets/seafood.png',
      description: 'A variety of fresh seafood',
      price: 18.99,
    ),
    FoodItem(
      name: 'Pasta',
      imageUrl: 'assets/pasta.png',
      description: 'Creamy pasta with a blend of sauces',
      price: 11.99,
    ),
  ];

  final List<FoodItem> dessertsItems = [
    FoodItem(
      name: 'Ice Cream',
      imageUrl: 'assets/icecream1.png',
      description: 'Creamy ice cream in various flavors',
      price: 4.50,
    ),
    FoodItem(
      name: 'Cake',
      imageUrl: 'assets/cake1.png',
      description: 'Rich and delicious cake',
      price: 5.50,
    ),
    FoodItem(
      name: 'Pudding',
      imageUrl: 'assets/pudding1.png',
      description: 'Smooth and creamy pudding',
      price: 3.50,
    ),
    FoodItem(
      name: 'Cupcake',
      imageUrl: 'assets/cupcake1.png',
      description: 'Delightful mini cakes',
      price: 2.50,
    ),
    FoodItem(
      name: 'Cheesecake',
      imageUrl: 'assets/cheesecake1.png',
      description: 'Creamy cheesecake with a graham cracker crust',
      price: 5.99,
    ),
    FoodItem(
      name: 'Brownie',
      imageUrl: 'assets/brownies.png',
      description: 'Fudgy brownie topped with chocolate',
      price: 3.99,
    ),
    FoodItem(
      name: 'Cookies',
      imageUrl: 'assets/cookies1.png',
      description: 'Freshly baked cookies',
      price: 1.99,
    ),
    FoodItem(
      name: 'Doughnut',
      imageUrl: 'assets/donuts1.png',
      description: 'Soft and fluffy doughnuts',
      price: 2.50,
    ),
  ];

  final List<FoodItem> beveragesItems = [
    FoodItem(
      name: 'Hot Drinks',
      imageUrl: 'assets/hd.png',
      description: 'Variety of hot beverages',
      price: 2.50,
    ),
    FoodItem(
      name: 'Soft Drinks',
      imageUrl: 'assets/soda.png',
      description: 'Chilled soft drinks to quench your thirst',
      price: 2.50,
    ),
    FoodItem(
      name: 'Iced Coffee',
      imageUrl: 'assets/icedcof.png',
      description: 'Iced coffee with a creamy finish',
      price: 3.50,
    ),
    FoodItem(
      name: 'Iced Tea',
      imageUrl: 'assets/teas.png',
      description: 'Cool iced tea with lemon flavor',
      price: 3.00,
    ),
    FoodItem(
      name: 'Juices',
      imageUrl: 'assets/juic.png',
      description: 'Freshly squeezed juices',
      price: 4.00,
    ),
    FoodItem(
      name: 'Smoothies',
      imageUrl: 'assets/smooz.png',
      description: 'Healthy and delicious smoothies',
      price: 4.50,
    ),
    FoodItem(
      name: 'Cocktails',
      imageUrl: 'assets/cockt.png',
      description: 'Refreshing cocktails with a twist',
      price: 5.50,
    ),
  ];

  final List<FoodItem> recommendedPlatesItems = [
    FoodItem(
      name: 'Honey Mustard Chicken',
      imageUrl: 'assets/honey mustard chicken.png',
      description: 'Tender chicken with a honey mustard glaze',
      price: 12.99,
    ),
    FoodItem(
      name: 'Piccata Mushroom Steak',
      imageUrl: 'assets/piccata mushroom steak.png',
      description: 'Steak with a savory mushroom sauce',
      price: 14.99,
    ),
  ];

  List<FoodItem> getAllItems() {
    return [
      ...mainCourseItems,
      ...dessertsItems,
      ...beveragesItems,
      ...recommendedPlatesItems,
    ];
  }

  List<FoodItem> filterItems(List<FoodItem> items, String searchQuery) {
    if (searchQuery.isEmpty) return items;

    return items.where((item) {
      return item.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          item.description.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        gap: 5,
        iconSize: 26,
        selectedIndex: currentPageIndex,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        activeColor: Colors.deepPurple,
        onTabChange: (index) {
          navigateToPage(index);
        },
        tabs: const [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.shopping_cart_rounded, text: 'Cart'),
          GButton(icon: Icons.person, text: 'Account')
        ],
      ),
      appBar: AppBar(
        title: const Text('Welcome to HurryBite'),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.purple[900]!,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.white),
                      SizedBox(width: 4),
                      Text('Cairo', style: TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchBar(),
              const SizedBox(height: 18),
              // Updated conditional structure for search results vs categories
            if (searchQuery.isNotEmpty) ...[
          sectionTitle("Search Results"),
        verticalFoodVariantList(
          getAllItems().where((item) =>
          item.name.toLowerCase().contains(searchQuery) ||
              item.description.toLowerCase().contains(searchQuery)
          ).toList(),
        ),
        const SizedBox(height: 20),
        ],
              if (searchQuery.isEmpty) ...[
                promotionalBanner(),
                sectionTitle("Select by category"),
                foodList(filterItems(mainCourseItems, searchQuery)),
                sectionTitle("Desserts"),
                foodList(filterItems(dessertsItems, searchQuery)),
                sectionTitle("Beverages"),
                foodList(filterItems(beveragesItems, searchQuery)),
                sectionTitle("Recommended Plates"),
                foodList(filterItems(recommendedPlatesItems, searchQuery)),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget searchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            searchQuery = value.toLowerCase();
          });
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "What are you craving for?",
          hintStyle: TextStyle(color: Colors.black),
          prefixIcon: Icon(Icons.search, color: Colors.black),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }

  Widget promotionalBanner() {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView(
            controller: _pageController,
            children: [
              singleBanner("Check Out Our Chicken Dishes", "assets/comfortfood.png"),
              singleBanner("We’ve got your dessert cravings covered!", "assets/p2.png"),
              singleBanner("Don't miss our must-try cocktails!", "assets/p3.png"),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          effect: ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: Colors.purple,
          ),
        ),
      ],
    );
  }

  Widget singleBanner(String title, String imagePath) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.purple[900]!,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 150,
              height: 130,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: 'Oswald',
          color: Colors.purple[900],
        ),
      ),
    );
  }

  Widget foodList(List<FoodItem> items) {
    if (items.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("No matching items found."),
      );
    }

    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodDetailPage(foodItem: item),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.only(right: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        item.imageUrl,
                        height: 100,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oswald',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
