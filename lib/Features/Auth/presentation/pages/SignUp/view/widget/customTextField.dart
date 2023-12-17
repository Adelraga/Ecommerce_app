import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Customformtextfield extends StatelessWidget {
  Customformtextfield({
    super.key,
    required this.hintText,
    required this.onChanged, this.obscureText =false, this.keyboardType, this.controller,
  });
  String? hintText;
  Function(String)? onChanged;
  final bool obscureText ;
  final TextInputType? keyboardType;
   final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
      },
      controller:controller ,
      keyboardType: keyboardType,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Color.fromARGB(255, 102, 102, 102)),
        enabledBorder: UnderlineInputBorder(
          //<-- SEE HERE
          borderSide:
              BorderSide(width: 1, color: Color.fromARGB(255, 90, 90, 90)),
        ),
        focusedBorder: UnderlineInputBorder(
          //<-- SEE HERE
          borderSide:
              BorderSide(width: 1, color: Color.fromARGB(255, 70, 70, 70)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
  }
}
