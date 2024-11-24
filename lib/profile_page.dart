import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.green,
                child: const Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // User Information
            Center(
              child: Text(
                "John Doe", // Replace with dynamic user name if needed
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                "johndoe@example.com", // Replace with dynamic user email if needed
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Settings Options
            const Text(
              "Account Settings",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.green),
              title: const Text("Edit Profile"),
              onTap: () {
                // Handle Edit Profile action
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock, color: Colors.green),
              title: const Text("Change Password"),
              onTap: () {
                // Handle Change Password action
              },
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Colors.green),
              title: const Text("Order History"),
              onTap: () {
                // Handle Order History action
              },
            ),
            ListTile(
              leading: const Icon(Icons.help, color: Colors.green),
              title: const Text("Help & Support"),
              onTap: () {
                // Handle Help & Support action
              },
            ),
            const SizedBox(height: 20),
            // Logout Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/signin');
                },
                icon: const Icon(Icons.logout),
                label: const Text("Log Out"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
