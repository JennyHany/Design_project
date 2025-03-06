import 'package:flutter/material.dart';

class PrivacySettingsPage extends StatelessWidget {
  const PrivacySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy Settings",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF100425), // Match the gradient start color
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Privacy Settings",
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                "At HurryBite, your privacy is our top priority. We are committed to protecting your personal information and ensuring transparency in how we handle your data. Below are the key aspects of our privacy policy:",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 20),
              _buildPrivacyPoint("1. **Data Collection**: We only collect the information necessary to provide and improve our services. This includes your name, email address, and usage data."),
              _buildPrivacyPoint("2. **Data Usage**: Your data is used solely for the purpose of delivering our services, personalizing your experience, and communicating with you."),
              _buildPrivacyPoint("3. **Data Protection**: We employ industry-standard security measures to safeguard your data from unauthorized access, alteration, or disclosure."),
              _buildPrivacyPoint("4. **Third-Party Sharing**: We do not sell, trade, or share your personal information with third parties unless required by law or with your explicit consent."),
              _buildPrivacyPoint("5. **Your Rights**: You have the right to access, update, or delete your personal information at any time. You can also opt out of data collection or request a copy of your data."),
              const SizedBox(height: 20),
              const Text(
                "If you have any questions or concerns about your privacy, please contact us at privacy@hurrybite.com.",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrivacyPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.circle, size: 8, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}