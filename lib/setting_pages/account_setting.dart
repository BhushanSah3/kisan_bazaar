// import 'package:flutter/material.dart';

// class AccountSetting extends StatelessWidget {
//   const AccountSetting({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }


// code for order completion

import 'package:flutter/material.dart';
import 'package:kisan_bazaar/home_page.dart';
import 'package:kisan_bazaar/profile_pages/shipping_page.dart';

class AccountSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Large image of celebration
            Expanded(
              child: Container(
                width: 700,
                child: Image.asset(
                  'assets/images/paymentcompleted.png', // Update with the image location
                 // fit: BoxFit.cover,
                ),
              ),
            ),
            
            SizedBox(height: 20),
            
            // Text: Order Completed
            Text(
              '    Order \nCompleted',
              style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Choose theme color
              ),
            ),
            
            SizedBox(height: 40),

            // Buttons: Track Order and Back to Home
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  ElevatedButton(
                   onPressed: () {
                      // Navigate back to home page
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShippingPage()),
                    );
                    },
                    style: ElevatedButton.styleFrom(
                     // backgroundColor: Colors.blue, // Button color
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delivery_dining),
                        SizedBox(width: 8),
                        Text(
                          'Track Order',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      // Navigate back to home page
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                    },
                    style: ElevatedButton.styleFrom(
                     // backgroundColor: Colors.grey.shade400, // Secondary button color
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home),
                        SizedBox(width: 8),
                        Text(
                          'Back to Home',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40), // Extra spacing at the bottom
          ],
        ),
      ),
    );
  }
}
