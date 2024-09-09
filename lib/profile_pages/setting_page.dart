import 'package:flutter/material.dart';
import 'package:kisan_bazaar/setting_pages/account_setting.dart';
import 'package:kisan_bazaar/setting_pages/add_payment.dart';
import 'package:kisan_bazaar/setting_pages/change_password.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isPushNotificationEnabled = true; // Toggle state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        leading: Icon(Icons.settings),
        backgroundColor: Colors.green, // Theme color matching
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // User Name Section
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'John Doe', // Replace with actual user name
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(),

            // Account Settings
            ListTile(
              title: const Text('Account Settings'),
              leading: const Icon(Icons.person),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountSetting()),
                );
              },
            ),
            const Divider(),

            // Edit Profile
            ListTile(
              title: const Text('Edit Profile'),
              leading: const Icon(Icons.edit),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountSetting()),
                );
              },
            ),
            const Divider(),

            // Change Password
            ListTile(
              title: const Text('Change Password'),
              leading: const Icon(Icons.lock),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePassword()),
                );
              },
            ),
            const Divider(),

            // Add Payment Method
            ListTile(
              title: const Text('Add Payment Method'),
              leading: const Icon(Icons.payment),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPayment()),
                );
              },
            ),
            const Divider(),

            // Push Notifications Toggle
            ListTile(
              title: const Text('Push Notifications'),
              leading: const Icon(Icons.notifications),
              trailing: Switch(
                value: isPushNotificationEnabled,
                onChanged: (bool value) {
                  setState(() {
                    isPushNotificationEnabled = value;
                  });
                },
                activeColor: Colors.green,
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
