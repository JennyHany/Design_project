import 'package:design_project_homepage/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final Color primaryColor = const Color(0xFF8E22D2); // Updated color

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile Settings",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Image & Name
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      userProvider.image != null
                          ? CircleAvatar(
                              radius: 60,
                              backgroundImage: FileImage(userProvider.image!),
                            )
                          : const CircleAvatar(
                              radius: 60, child: Icon(Icons.person)),
                      /*Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,
                          ),
                          child: const Icon(Icons.camera_alt,
                              color: Colors.white, size: 16),
                        ),
                      ),*/
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    userProvider.username,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    userProvider.email,
                    style: const TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Profile Options
            settingsOption(
              Icons.person,
              "Personal Data",
              () {Navigator.pushNamed(context, '/personaldata');},
            ),
            settingsOption(
              Icons.settings,
              "Settings",
              () {},
            ),
            settingsOption(
              Icons.credit_card,
              "Cards",
              () {},
            ),

            const SizedBox(height: 10),

            // Support Options
            settingsOption(
              Icons.help_outline,
              "Help Center",
              () {},
            ),
            //settingsOption(Icons.delete_outline, "Request Account Deletion"),
            //settingsOption(Icons.person_add, "Add another account"),

            const SizedBox(height: 20),

            // Sign Out Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xff8E22D2),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                label: const Text(
                  "Sign Out",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                icon: const Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: 3,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  // Settings Option Widget
  Widget settingsOption(
      IconData icon, String title, void Function() operation) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: operation,
    );
  }
}
