import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.controller});
  final controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
              borderRadius: BorderRadius.circular(12)),
          hintText: " My Address ",
          hintStyle: TextStyle(color: Colors.black)),
      style: TextStyle(color: Colors.black),
    );
  }
}
