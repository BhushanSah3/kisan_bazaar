import 'package:flutter/material.dart';
import 'package:kisan_bazaar/cart_page.dart';
import 'package:kisan_bazaar/checkout_page.dart';
import 'package:kisan_bazaar/negotiation_page.dart';

class ProductDetailPage extends StatefulWidget {
  final String productName; // Name of the product from the list
  final double productPrice; // Price of the product from the list
  final String productImage; // Product image from the list

  const ProductDetailPage({
    required this.productName,
    required this.productPrice,
    required this.productImage,
    Key? key,
  }) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1; // Default quantity

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.productName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Colors.green,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Large product image
            Center(
              child: Image.asset(
                widget.productImage,
                height: 250,
                width: 250,
              ),
            ),
            SizedBox(height: 20),

            // Product name and price
            Text(
              widget.productName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10),

            Text(
              '\₹ ${widget.productPrice.toStringAsFixed(2)} per unit',
              style: Theme.of(context).textTheme.titleMedium,
            ),

            SizedBox(height: 20),

            // Quantity and favourite/share options
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: quantity > 1
                          ? () {
                              setState(() {
                                quantity--;
                              });
                            }
                          : null,
                    ),
                    Text(
                      '$quantity',
                      style: TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
                // share and favourite write part
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {
                        // Add to favourite logic here
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {
                        // Share logic here
                      },
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),

            // TextField(
            //   maxLines: 1,
            //   decoration: InputDecoration(
            //     hintText: 'Write your review',
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10.0),
            //     ),
            //   ),
            //   onSubmitted: (value) {
            //     // Navigate to negotiation page when review is submitted
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => NegotiationPage(
            // productName: widget.productName,
            //             productPrice: widget.productPrice,
            //             quantity: quantity,
            //             productImage:
            //                 widget.productImage ), // Replace with actual page
            //       ),
            //     );
            //   },
            // ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                // Pass product details when navigating to the NegotiationPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NegotiationPage(
                        productName: widget.productName,
                        productPrice: widget.productPrice,
                        quantity: quantity,
                        productImage:
                            widget.productImage // Pass the updated quantity
                        ),
                  ),
                );
              },
              child: Text(
                'Negotiation Chat: ',
                style: TextStyle(color: Colors.black),
              ),
            ),

            // Spacer(int flex: 1,);
            SizedBox(
              height: 110,
            ),

            // Bottom mini navigation for chat, cart, and buy now
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //CHAT NOWW
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    // Navigate to chat page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NegotiationPage(
                              productName: widget.productName,
                              productPrice: widget.productPrice,
                              quantity: quantity,
                              productImage: widget
                                  .productImage)), // Replace with actual ChatPage
                    );
                  },
                  child: Text(
                    'Chat Now',
                    style: TextStyle(color: Colors.black),
                  ),
                ),

/////////////////////////////// shopping cart
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  color: Colors.black,
                  onPressed: () {
                    // Add to cart logic here
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  },
                ),

                ///BUY NOWW
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    // Navigate to Checkout Page with product details and quantity
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckoutPage(
                          productName: widget.productName,
                          productPrice: widget.productPrice,
                          initialQuantity: quantity,
                          productImage: widget.productImage,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Buy Now',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
