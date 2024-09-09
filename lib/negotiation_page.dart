import 'package:flutter/material.dart';
import 'package:kisan_bazaar/checkout_page.dart';
import 'package:kisan_bazaar/home_page.dart';

class NegotiationPage extends StatefulWidget {
  final String productName;
  final double productPrice;
  final int quantity;
  final String productImage; // Add productImage parameter

  const NegotiationPage({
    required this.productName,
    required this.productPrice,
    required this.quantity,
    required this.productImage, // Add productImage to constructor
    Key? key,
  }) : super(key: key);

  @override
  _NegotiationPageState createState() => _NegotiationPageState();
}

class _NegotiationPageState extends State<NegotiationPage> {
  final List<Map<String, String>> _conversation =
      []; // For storing conversation messages
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.chat),
            SizedBox(width: 10),
            Text(
              'Negotiation Chat',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
                backgroundColor: Colors.green,

      ),
      body: Column(
        children: <Widget>[
          // Conversation Field (Scrollable)
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: _conversation.length,
              itemBuilder: (context, index) {
                var message = _conversation[index];
                return Align(
                  alignment: message['type'] == 'user'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: message['type'] == 'user'
                          ? Colors.green[200]
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      message['message']!,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          // Agree/Decline Buttons
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Pass product details to CheckoutPage when Agree is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckoutPage(
                          productName: widget.productName,
                          productPrice: widget.productPrice,
                          initialQuantity: widget.quantity,
                          productImage:
                              widget.productImage, // Pass product image
                        ),
                      ),
                    );
                  },
                  child: Text('Agree'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade400,
                  ),
                ),


                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text('Decline'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade400, //removed red color
                  ),
                ),
              ],
            ),
          ),
          // Message Input Field with Send Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[

                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                       hintStyle: TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),

                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      setState(() {
                        _conversation.add({
                          'type': 'user',
                          'message': _messageController.text,
                        });
                        _messageController.clear();

                        // Simulating seller's response eg  
                        Future.delayed(Duration(seconds: 1), () {
                          setState(() {
                            _conversation.add({
                              'type': 'seller',
                              'message': 'I agree with the price!',
                            });
                          });
                        });
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
