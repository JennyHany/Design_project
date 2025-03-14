import 'package:design_project_homepage/personal_data_screen.dart';
import 'package:design_project_homepage/profile_page.dart';
import 'package:design_project_homepage/reset_pass_screen.dart';
import 'package:design_project_homepage/shopping_cart_page.dart';
import 'package:design_project_homepage/sign_in_page.dart';
import 'package:design_project_homepage/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'food_item.dart';
import 'food_detail_page.dart'; // Import the FoodDetailPage
import 'otp_screen.dart';
import 'pages/onboarding_screen.dart';
import 'pages/splash.dart';
import 'sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      //  home: FoodHomePage(),
    );
  }
}

class FoodHomePage extends StatefulWidget {
  @override
  State<FoodHomePage> createState() => _FoodHomePageState();
}

class _FoodHomePageState extends State<FoodHomePage> {
  int currentPageIndex = 0;

  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.onlyShowSelected;

  void navigateToPage(int index) {
    setState(() {
      currentPageIndex = index;
    });

    // Check if the Cart tab (index 1) is selected
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
      name: 'Pizza',
      imageUrl: 'assets/pizza.png',
      description: 'Delicious cheesy pizza with toppings',
      price: 9.99,
    ),
    FoodItem(
      name: 'Burger',
      imageUrl: 'assets/burger.png',
      description: 'Juicy beef burger with fresh lettuce',
      price: 8.99,
    ),
    FoodItem(
      name: 'Chicken',
      imageUrl: 'assets/chicken.png',
      description: 'Grilled chicken served with spices',
      price: 10.99,
    ),
    FoodItem(
      name: 'Steak',
      imageUrl: 'assets/steak.png',
      description: 'Tender steak cooked to perfection',
      price: 15.99,
    ),
    FoodItem(
      name: 'Ham',
      imageUrl: 'assets/ham.png',
      description: 'Smoked ham with a savory flavor',
      price: 12.99,
    ),
    FoodItem(
      name: 'Sushi',
      imageUrl: 'assets/sushi.png',
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
      name: 'Shrimp',
      imageUrl: 'assets/shrimp.png',
      description: 'Succulent shrimp cooked with herbs',
      price: 13.99,
    ),
    FoodItem(
      name: 'Pasta',
      imageUrl: 'assets/pasta.png',
      description: 'Creamy pasta with a blend of sauces',
      price: 11.99,
    ),
  ];

  final List<FoodItem> appetizersItems = [
    FoodItem(
      name: 'Chicken Wings',
      imageUrl: 'assets/chicken wings.png',
      description: 'Crispy chicken wings tossed in sauce',
      price: 7.99,
    ),
    FoodItem(
      name: 'Onion Rings',
      imageUrl: 'assets/onion rings.png',
      description: 'Golden-fried onion rings',
      price: 5.99,
    ),
    FoodItem(
      name: 'Tacos',
      imageUrl: 'assets/tacos.png',
      description: 'Soft shell tacos filled with meat and toppings',
      price: 6.99,
    ),
    FoodItem(
      name: 'Spring Rolls',
      imageUrl: 'assets/spring rolls.png',
      description: 'Crispy spring rolls with dipping sauce',
      price: 5.49,
    ),
    FoodItem(
      name: 'Salad',
      imageUrl: 'assets/salad.png',
      description: 'Fresh garden salad with dressing',
      price: 4.99,
    ),
    FoodItem(
      name: 'Fries',
      imageUrl: 'assets/fries.png',
      description: 'Crispy french fries',
      price: 3.99,
    ),
  ];

  final List<FoodItem> dessertsItems = [
    FoodItem(
      name: 'Ice Cream',
      imageUrl: 'assets/ice cream.png',
      description: 'Creamy ice cream in various flavors',
      price: 4.50,
    ),
    FoodItem(
      name: 'Cake',
      imageUrl: 'assets/cake.png',
      description: 'Rich and delicious cake',
      price: 5.50,
    ),
    FoodItem(
      name: 'Pudding',
      imageUrl: 'assets/pudding.png',
      description: 'Smooth and creamy pudding',
      price: 3.50,
    ),
    FoodItem(
      name: 'Gateau',
      imageUrl: 'assets/gateau.png',
      description: 'Decadent chocolate gateau',
      price: 6.50,
    ),
    FoodItem(
      name: 'Cupcake',
      imageUrl: 'assets/cupcake.png',
      description: 'Delightful mini cakes',
      price: 2.50,
    ),
    FoodItem(
      name: 'Cheesecake',
      imageUrl: 'assets/cheesecake.png',
      description: 'Creamy cheesecake with a graham cracker crust',
      price: 5.99,
    ),
    FoodItem(
      name: 'Brownie',
      imageUrl: 'assets/brownie.png',
      description: 'Fudgy brownie topped with chocolate',
      price: 3.99,
    ),
    FoodItem(
      name: 'Cookies',
      imageUrl: 'assets/cookies.png',
      description: 'Freshly baked cookies',
      price: 1.99,
    ),
    FoodItem(
      name: 'Doughnut',
      imageUrl: 'assets/doughnut.png',
      description: 'Soft and fluffy doughnuts',
      price: 2.50,
    ),
  ];

  final List<FoodItem> coldBeveragesItems = [
    FoodItem(
      name: 'Cocktails',
      imageUrl: 'assets/cocktails.png',
      description: 'Refreshing cocktails with a twist',
      price: 5.50,
    ),
    FoodItem(
      name: 'Soft Drinks',
      imageUrl: 'assets/soft drinks.png',
      description: 'Chilled soft drinks to quench your thirst',
      price: 2.50,
    ),
    FoodItem(
      name: 'Iced Tea',
      imageUrl: 'assets/iced tea.png',
      description: 'Cool iced tea with lemon flavor',
      price: 3.00,
    ),
    FoodItem(
      name: 'Juices',
      imageUrl: 'assets/juices.png',
      description: 'Freshly squeezed juices',
      price: 4.00,
    ),
    FoodItem(
      name: 'Smoothies',
      imageUrl: 'assets/smoothies.png',
      description: 'Healthy and delicious smoothies',
      price: 4.50,
    ),
    FoodItem(
      name: 'Iced Coffee',
      imageUrl: 'assets/iced coffee.png',
      description: 'Iced coffee with a creamy finish',
      price: 3.50,
    ),
  ];

  final List<FoodItem> hotBeveragesItems = [
    FoodItem(
      name: 'Hot Tea',
      imageUrl: 'assets/hot tea.png',
      description: 'Soothing hot tea with a blend of herbs',
      price: 2.50,
    ),
    FoodItem(
      name: 'Hot Drinks',
      imageUrl: 'assets/hot drinks.png',
      description: 'Variety of hot beverages',
      price: 2.50,
    ),
    FoodItem(
      name: 'Hot Coffee',
      imageUrl: 'assets/hot coffee.png',
      description: 'Rich and aromatic hot coffee',
      price: 3.00,
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
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.shopping_cart_rounded,
            text: 'Cart',
          ),
          GButton(
            icon: Icons.person,
            text: 'Account',
          )
        ],
      ),
      appBar: AppBar(
        title: const Text('Welcome to FoodApp'),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.white),
                      SizedBox(width: 4),
                      Text(
                        'Cairo',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
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
              const SizedBox(height: 16),
              promotionalBanner(),
              sectionTitle("Main Course"),
              foodList(mainCourseItems),
              sectionTitle("Appetizers"),
              foodList(appetizersItems),
              sectionTitle("Desserts"),
              foodList(dessertsItems),
              sectionTitle("Cold Beverages"),
              foodList(coldBeveragesItems),
              sectionTitle("Hot Beverages"),
              foodList(hotBeveragesItems),
              sectionTitle("Recommended Plates"),
              foodList(recommendedPlatesItems),
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
      child: const TextField(
        decoration: InputDecoration(
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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.red[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fresh Meat",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 4),
                Text(
                  "20% Off",
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/fresh_meat_banner.png',
              width: 130,
              height: 130,
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
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    );
  }

  Widget foodList(List<FoodItem> items) {
    return Container(
      height: 170,
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
              margin: const EdgeInsets.only(right: 10),
              child: Column(
                children: [
                  Image.asset(
                    item.imageUrl,
                    height: 130,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
