import 'package:flutter/material.dart';
import 'package:kisan_bazaar/home_page.dart';
import 'package:kisan_bazaar/profile_pages/seller_item_page.dart';
import 'package:kisan_bazaar/profile_pages/setting_page.dart';
import 'package:kisan_bazaar/profile_pages/shipping_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Profile Photo
              CircleAvatar(
                radius: 60,
                backgroundImage: const AssetImage('assets/images/Group1.png'), // Replace with actual profile photo path
              ),
              const SizedBox(height: 40),

              // User Name
              const Text(
                'Baby John', // Replace with the actual user name
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 60),

              // Sell Button with prefix and suffix icons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SellItemsPage()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.store, color: Colors.black), // Prefix icon
                      Text(
                        'Sell',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.black), // Suffix icon
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Buy Button with prefix and suffix icons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.shopping_cart, color: Colors.black), // Prefix icon
                      Text(
                        'Buy',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.black), // Suffix icon
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Shipping Button with prefix and suffix icons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShippingPage()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.local_shipping, color: Colors.black), // Prefix icon
                      Text(
                        'Shipping',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.black), // Suffix icon
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // Settings Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.settings, color: Colors.black),
                  label: const Text(
                    'Settings',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Adds some space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
