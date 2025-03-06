import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // For opening email client

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Help Center",
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
                "Welcome to the HurryBite Help Center!",
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "We're here to assist you with any questions or concerns you may have. Please check the topics below for answers to common issues. If you still need help, our support team is always ready to assist you.",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                "Frequently Asked Questions (FAQs)",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildFAQSection(
                "1️⃣ Account & Login Issues",
                [
                  "Q: I forgot my password. How can I reset it?",
                  "A: Tap on 'Forgot Password' on the login screen and follow the instructions to reset your password. If you don't receive an email, check your spam folder.",
                  "Q: How do I change my email or phone number?",
                  "A: Go to Settings > Account Details, then update your email or phone number.",
                ],
              ),
              _buildFAQSection(
                "2️⃣ Orders & Deliveries",
                [
                  "Q: My order is delayed. What should I do?",
                  "A: If your order is late, please check the tracking details first. If it’s still not delivered, contact support.",
                ],
              ),
              _buildFAQSection(
                "3️⃣ Payments & Refunds",
                [
                  "Q: What payment methods do you accept?",
                  "A: We accept credit/debit cards, mobile wallets, and cash on delivery (in selected areas).",
                  "Q: How do I request a refund?",
                  "A: If there's an issue with your order, go to 'My Orders' > Select Order > Request Refund or contact support.",
                ],
              ),
              _buildFAQSection(
                "4️⃣ Security & Privacy",
                [
                  "Q: Is my personal data safe?",
                  "A: Yes! We use encryption and strict security policies to protect your data.",
                  "Q: How can I report suspicious activity?",
                  "A: If you notice unauthorized account activity, change your password immediately and email us at security@hurrybite.com.",
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Still Need Help? Contact Support!",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  final Uri emailUri = Uri(
                    scheme: 'mailto',
                    path: 'support@hurrybite.com',
                  );

                  if (await canLaunch(emailUri.toString())) {
                    await launch(emailUri.toString());
                  } else {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Could not launch email app. Please ensure you have an email app installed.")),
                      );
                    }
                  }
                },
                child: const Text(
                  "📩 Email us at: support@hurrybite.com",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
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

  // Helper method to build FAQ sections
  Widget _buildFAQSection(String title, List<String> content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...content.map((text) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        }).toList(),
        const SizedBox(height: 20),
      ],
    );
  }
}