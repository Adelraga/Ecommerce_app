import 'package:flutter/material.dart';

class CustomGenderForm extends StatefulWidget {
  CustomGenderForm({Key? key, this.controller}) : super(key: key);
  final TextEditingController? controller;

  @override
  State<CustomGenderForm> createState() => _CustomGenderFormState();
}

class _CustomGenderFormState extends State<CustomGenderForm> {
  List<String> genders = ["Male", "Female", "Other"];

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller, // Access controller using widget.controller
      style: TextStyle(color: Colors.black),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: "Gender",
        hintStyle: TextStyle(color: Color.fromARGB(255, 102, 102, 102)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 90, 90, 90)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 70, 70, 70)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        suffixIcon: DropdownButton<String>(
          value: widget.controller!.text.isNotEmpty
              ? widget.controller!.text
              : null, // Set the initial value of the Dropdown
          items: genders.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              widget.controller!.text = newValue ?? ''; // Update the controller's text
            });
          },
        ),
      ),
    );
  }
}
