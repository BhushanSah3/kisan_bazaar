import 'package:flutter/material.dart';
import 'package:kisan_bazaar/cart_page.dart';
import 'package:kisan_bazaar/home_page.dart';

class CheckoutPage extends StatefulWidget {
  final String productName;
  final double productPrice;
  final int initialQuantity;
  final String productImage;

  const CheckoutPage({
    required this.productName,
    required this.productPrice,
    required this.initialQuantity,
    required this.productImage,
    super.key,
  });

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}


class _CheckoutPageState extends State<CheckoutPage> {
  int quantity = 1; // Product quantity
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  double get productTotal => widget.productPrice * quantity; // Total cost calculation
  double get shippingFee => 10.0; // Flat shipping fee
  double get gstTax => productTotal * 0.18; // GST Tax calculation (18%)
  double get totalAmount => productTotal + shippingFee + gstTax; // Final total calculation

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity; // Fetch quantity from the previous page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout',
        style: Theme.of(context).textTheme.titleMedium,

        ),
        backgroundColor: Colors.green,

      ),


      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order List
            SizedBox(
              height: 180, // To fit the product details
              child: Card(
                elevation: 3,
                child: Row(
                  children: [
                    // Product Image
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        widget.productImage,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    // Product Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.productName,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Price: \₹${widget.productPrice.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          // Quantity Selector
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
                                style: TextStyle(fontSize: 16),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Contact Information
            Text(
              'Contact Information',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _addressController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Shipping Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Payment Method
            Text(
              'Payment Method',
              style: Theme.of(context).textTheme.titleMedium,
            ),


            /// moving to cart page 
            ListTile(
              title: Text('UPI Apps'),
              leading: Icon(Icons.payment),
              onTap: () {
                // Navigate to Cart Page (or payment logic)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
            ),
            SizedBox(height: 20),

            // Order Summary
            Text(
              'Order Summary',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10),
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Item:'),
                        Text(widget.productName),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Quantity:'),
                        Text('$quantity'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Cost:'),
                        Text('\₹${productTotal.toStringAsFixed(2)}'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shipping Fee:'),
                        Text('\₹${shippingFee.toStringAsFixed(2)}'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tax (GST):'),
                        Text('\₹${gstTax.toStringAsFixed(2)}'),
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          '\₹${totalAmount.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
      
            onPressed: () {
              // Proceed to checkout
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Order Placed'),
                  content: Text('Your order has been placed successfully!'),
                  actions: [
                    TextButton(
                      onPressed: () {

                        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                    },
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: Text('Place Order'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15),
              textStyle: TextStyle(fontSize: 18,
              color: Colors.black),
              //primary: Theme.of(context).colorScheme.primary,
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),

      
    );
  }
}
