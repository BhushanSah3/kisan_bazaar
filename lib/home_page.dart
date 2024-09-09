import 'package:flutter/material.dart';
import 'package:kisan_bazaar/cart_page.dart';
import 'package:kisan_bazaar/detailed_product.dart';
import 'package:kisan_bazaar/profile_page.dart';
import 'package:kisan_bazaar/setting_pages/product_model.dart'; // Import the product model

// Define the list of products
List<Product> products = [
  Product(
    name: "Apple",
    description: "Fresh and juicy red apples.",
    image: 'assets/images/apple.png',
    quantity: 100,
    price: 120,
  ),
  Product(
    name: "Banana",
    description: "Ripe yellow bananas rich in potassium.",
    image: 'assets/images/banana.png',
    quantity: 200,
    price: 50,
  ),
  Product(
    name: "Carrot",
    description: "Crunchy and sweet carrots, full of vitamins.",
    image: 'assets/images/carrot.png',
    quantity: 120,
    price: 60,
  ),
  Product(
    name: "Orange",
    description: "Citrus oranges rich in Vitamin C.",
    image: 'assets/images/orange.png',
    quantity: 90,
    price: 70,
  ),
  Product(
      name: "Tomato",
      description: "Organic red tomatoes perfect for salads and cooking.",
      image: "assets/images/tomato.png",
      quantity: 150,
      price: 30),
  Product(
      name: "Spinach",
      description: "Fresh green spinach leaves, great for health.",
      image: "assets/images/spinach.png",
      quantity: 80,
      price: 40),
  Product(
      name: "Cabbage",
      description: "Fresh green cabbage for a healthy diet.",
      image: "assets/images/cabbage.png",
      quantity: 70,
      price: 45),
  Product(
      name: "Potato",
      description: "Versatile and tasty potatoes, great for any meal.",
      image: "assets/images/potato.png",
      quantity: 300,
      price: 25),
  Product(
      name: "Grapes",
      description: "Seedless grapes, sweet and juicy.",
      image: "assets/images/grapes.png",
      quantity: 100,
      price: 90),
  Product(
      name: "Broccoli",
      description: "Nutritious broccoli, great for steaming and stir-fry.",
      image: "assets/images/broccoli.png",
      quantity: 50,
      price: 80),
];

class HomePage extends StatelessWidget {
  static  const String routeName = "/home"; 
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'What are you looking for?',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          // Product List
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          productName: product.name,
                          productPrice: product.price,
                          productImage: product.image,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: ListTile(
                      leading: Image.asset(product.image), // Use product image
                      title: Text(product.name),
                      subtitle: Text('\₹ ${product.price} per kg'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              // Home already on HomePage, no action required
              break;
            case 1:
              // Navigate to Cart Page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
              break;
            case 2:
              // Navigate to Profile Page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
          }
        },
      ),
    );
  }
}
