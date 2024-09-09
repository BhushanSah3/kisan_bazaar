// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final int maxLines;
//   const CustomTextField({
//     Key? key,
//     required this.controller,
//     required this.hintText,
//     this.maxLines = 1, required bool obscureText,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//           hintText: hintText,
//           border: const OutlineInputBorder(
//               borderSide: BorderSide(
//             color: Colors.black38,
//           )),
//           enabledBorder: const OutlineInputBorder(
//               borderSide: BorderSide(
//             color: Colors.black38,
//           ))),
//       validator: (val) {
//         if (val == null || val.isEmpty) {
//           return 'Enter your $hintText';
//         }
//         return null;
//       },
//       maxLines: maxLines,
//     );
//   }
// }


import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? prefixIcon; // Add this line to accept prefixIcon as a parameter

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.prefixIcon, // Add this line to the constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon, // Use the prefixIcon here
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $hintText';
        }
        return null;
      },
    );
  }
}
