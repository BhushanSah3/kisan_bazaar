import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SellItemsPage extends StatefulWidget {
  @override
  _SellItemsPageState createState() => _SellItemsPageState();
}

class _SellItemsPageState extends State<SellItemsPage> {
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemPriceController = TextEditingController();
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                backgroundColor: Colors.green,

        title:
            Text('Sell Item', style: Theme.of(context).textTheme.titleLarge),
        leading: Icon(Icons.sell), 
        centerTitle: true,// Adding a relevant icon
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Item Name Text Field
            TextField(
              controller: _itemNameController,
              decoration: InputDecoration(
                labelText: 'Item Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),

            // Item Price Text Field
            TextField(
              controller: _itemPriceController,
              decoration: InputDecoration(
                labelText: 'Item Price',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 30),

            // Image Picker Section
            Center(
              child: Column(
                children: [
                  // Display the selected image
                  _image != null
                      ? Image.file(_image!, height: 150)
                      : Text('No Image Selected',
                          style: TextStyle(fontSize: 16)),
                  SizedBox(height: 40),
                  ElevatedButton.icon(
                    onPressed: () {
                      _showImagePicker(context);
                    },
                    icon: Icon(Icons.photo_camera),
                    label: Text('Upload Picture'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),

            Center(
              child: SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .primary, // Theme background color
                    foregroundColor: Colors.black, // Text color set to black
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    _addToCatalogue();
                  },
                  child: Text(
                    'Add to Catalogue',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Function to pick image either from camera or gallery
  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take a Picture'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Add item to catalog (This is a placeholder function)
  void _addToCatalogue() {
    final String itemName = _itemNameController.text;
    final String itemPrice = _itemPriceController.text;

    if (itemName.isEmpty || itemPrice.isEmpty || _image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields and upload a picture.')),
      );
    } else {
      // Here you can add the item to your catalog
      // Navigate to Catalogue Page or perform relevant action
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Item added to catalogue!')),
      );
    }
  }
}

// <uses-permission android:name="android.permission.CAMERA"/>
// <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
// <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
