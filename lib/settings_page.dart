import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF100425), // Match the gradient start color
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Notifications
              settingsOption(
                Icons.notifications,
                "Notifications",
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NotificationsPage()),
                  );
                },
              ),
              // Language
              settingsOption(
                Icons.language,
                "Language",
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LanguagePage()),
                  );
                },
              ),
              // Dark Mode
              settingsOption(
                Icons.dark_mode,
                "Dark Mode",
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DarkModePage()),
                  );
                },
              ),
              // Privacy Settings
              settingsOption(
                Icons.security,
                "Privacy Settings",
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PrivacySettingsPage()),
                  );
                },
              ),
              // Security
              settingsOption(
                Icons.lock_outline,
                "Security",
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecurityPage()),
                  );
                },
              ),
              // Delete Account
              settingsOption(
                Icons.delete,
                "Delete Account",
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DeleteAccountPage()),
                  );
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build settings options
  Widget settingsOption(IconData icon, String title, void Function() onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
      onTap: onTap,
    );
  }
}

// Notifications Page
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifications",
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Notification Settings",
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildSwitch("Enable Notifications", true),
              _buildSwitch("Sound Alerts", false),
              _buildSwitch("Vibrate on Notifications", true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitch(String title, bool value) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
      value: value,
      onChanged: (bool newValue) {
        // Handle switch state change
      },
      activeColor: const Color(0xFF8E22D2),
    );
  }
}

// Language Page
class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Language",
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Language Settings",
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildLanguageOption("English", true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String language, bool isSelected) {
    return ListTile(
      title: Text(language, style: const TextStyle(color: Colors.white, fontSize: 16)),
      trailing: isSelected
          ? const Icon(Icons.check, color: Color(0xFF8E22D2))
          : null,
      onTap: () {
        // Handle language selection
      },
    );
  }
}

// Dark Mode Page
class DarkModePage extends StatelessWidget {
  const DarkModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dark Mode",
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Dark Mode Settings",
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildSwitch("Enable Dark Mode", true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitch(String title, bool value) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
      value: value,
      onChanged: (bool newValue) {
        // Handle switch state change
      },
      activeColor: const Color(0xFF8E22D2),
    );
  }
}

// Privacy Settings Page
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
        child: Padding(
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
                "We respect your privacy. Here are the key points of our privacy policy:",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 10),
              _buildPrivacyPoint("1. We do not share your data with third parties."),
              _buildPrivacyPoint("2. Your data is encrypted and stored securely."),
              _buildPrivacyPoint("3. You can delete your account and data at any time."),
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

// Security Page
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Security Settings",
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildSecurityOption("Enable Two-Factor Authentication", true),
              _buildSecurityOption("Change Password", false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecurityOption(String title, bool isEnabled) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
      value: isEnabled,
      onChanged: (bool newValue) {
        // Handle switch state change
      },
      activeColor: const Color(0xFF8E22D2),
    );
  }
}

// Delete Account Page
class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Delete Account",
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Delete Account",
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                "Are you sure you want to delete your account? This action cannot be undone.",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle account deletion
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: const Text(
                    "Delete Account",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}