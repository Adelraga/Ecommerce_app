import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Customformtextfield extends StatelessWidget {
  Customformtextfield({
    super.key,
    required this.hintText,
    required this.onChanged,
  });
  String? hintText;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
      },
      onChanged: onChanged,
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
