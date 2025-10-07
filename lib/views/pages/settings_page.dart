import 'package:flutter/material.dart';
import 'package:flutter_app/views/pages/welcome_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            trailing: Icon(Icons.dark_mode),
            title: const Text('Theme'),
            onTap: () {
              // Handle theme tap
            },
          ),
          ListTile(
            trailing: Icon(Icons.language),
            title: const Text('Language'),
            onTap: () {
              // Handle language tap
            },
          ),
          ListTile(
            trailing: Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              // Handle notifications tap
            },
          ),
          ListTile(
            trailing: Icon(Icons.lock),
            title: const Text('Privacy'),
            onTap: () {
              // Handle privacy tap
            },
          ),
          ListTile(
            trailing: Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              // Handle about tap
            },
          ),
          ListTile(
            trailing: Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Logout successful'),
                  duration: Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                ),
              );
              Future.delayed(Duration(milliseconds: 500), () {
                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomePage()),
                  );
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
