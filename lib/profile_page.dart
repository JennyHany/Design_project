import 'dart:io'; // For File class
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For image picking
import 'package:provider/provider.dart'; // For state management
import 'package:design_project_homepage/user_provider.dart'; // Your UserProvider class

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final Color primaryColor = const Color(0xFF8E22D2); // Updated color

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.transparent, // Make scaffold background transparent
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent app bar
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile Settings",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Save functionality
            },
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF100425), Color(0xFF1A053D)],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Profile Image & Name
              Center(
                child: Stack(
                  children: [
                    userProvider.image != null
                        ? CircleAvatar(
                      radius: 60,
                      backgroundImage: FileImage(userProvider.image!),
                    )
                        : const CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 50, color: Colors.grey),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => _pickImage(userProvider),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                userProvider.username,
                style: const TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                userProvider.email,
                style: const TextStyle(color: Colors.grey, fontSize: 18),
              ),
              const SizedBox(height: 30),

              // Profile Options
              settingsOption(
                Icons.person,
                "Personal Data",
                    () {
                  Navigator.pushNamed(context, '/personaldata');
                },
              ),
              settingsOption(
                Icons.settings,
                "Settings",
                    () {
                  // Navigate to settings page
                },
              ),
              settingsOption(
                Icons.credit_card,
                "Cards",
                    () {
                  // Navigate to cards page
                },
              ),
              settingsOption(
                Icons.help_outline,
                "Help Center",
                    () {
                  // Navigate to help center page
                },
              ),

              const SizedBox(height: 20),

              // Sign Out Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Sign out functionality
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: primaryColor,
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
      ),
    );
  }

  // Helper method to build profile options
  Widget settingsOption(IconData icon, String title, void Function() onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
      onTap: onTap,
    );
  }

  // Function to pick an image from the gallery or camera
  Future<void> _pickImage(UserProvider userProvider) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      userProvider.setImage(File(pickedFile.path));
    }
  }
}