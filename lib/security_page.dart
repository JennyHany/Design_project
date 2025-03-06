import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // For launching email
import 'privacy_settings_page.dart'; // Import the PrivacySettingsPage

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Security",
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
                "Security",
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                "At HurryBite, your security is our top priority. We are committed to protecting your personal information and ensuring a safe experience on our platform.",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                "Your Account Protection",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildSecurityTip("1. Keep your login credentials secure and do not share them with anyone."),
              _buildSecurityTip("2. Always use a strong, unique password to prevent unauthorized access."),
              _buildSecurityTip("3. Log out from shared or public devices after using the app."),
              const SizedBox(height: 20),
              const Text(
                "Recognizing Suspicious Activity",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildSecurityTip("1. If you notice any unusual activity on your account, such as unrecognized logins or orders, change your password immediately."),
              _buildSecurityTip("2. Beware of phishing attempts—HurryBite will never ask for your password or payment details via email or messages."),
              const SizedBox(height: 20),
              const Text(
                "What to Do If Your Account is Compromised",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildSecurityTip("1. Reset your password immediately from the settings page."),
              _buildSecurityTip("2. Contact our support team at:"),

              // Clickable Email Link
              GestureDetector(
                onTap: () => _launchEmail(),
                child: const Text(
                  "security@hurrybite.com",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),

              _buildSecurityTip("3. Review your recent account activity to ensure no unauthorized changes have been made."),
              const SizedBox(height: 20),

              // Privacy Policy Link
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PrivacySettingsPage()),
                  );
                },
                child: const Text(
                  "For more information, visit our Privacy Policy.",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecurityTip(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 8), // Removed the bullet point icon
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

  // Function to launch email client
  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'security@hurrybite.com',
      queryParameters: {
        'subject': 'Support Request',
        'body': 'Hello HurryBite Team,\n\nI need help with...',
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      debugPrint("Could not launch email client.");
    }
  }
}
