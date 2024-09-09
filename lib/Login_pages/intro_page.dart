import 'package:flutter/material.dart';
import 'package:kisan_bazaar/Login_pages/sign_in_page.dart';
import 'package:kisan_bazaar/Login_pages/sign_up_page.dart';


class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            // Logo and title section
            Column(
              children: [
                Image.asset('assets/images/Group1.png',
                    height: 100), // replace with your logo asset
               SizedBox(height: 20),
                Text(
                  'Kisan Baazar',
                  style: Theme.of(context).textTheme.titleLarge,
              
                ),
               SizedBox(height: 10),
                Text(
                  'Empowering farmers with direct market access for optimal harvest value',
                  textAlign: TextAlign.center,
                 style: Theme.of(context).textTheme.titleSmall,

                ),
              ],
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              
              child: Text(
                'GET STARTED',
                style: TextStyle(fontSize: 18,
                ),

             //icon: Icon(Icons.arrow_forward),
                
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
