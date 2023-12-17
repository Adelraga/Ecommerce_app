import 'package:flutter/material.dart';

class CustomDateOfBirthFormField extends StatefulWidget {
  CustomDateOfBirthFormField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.obscureText = false,
    this.keyboardType, this.controller,
  }) : super(key: key);

  final String? hintText;
  final Function(String)? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  State<CustomDateOfBirthFormField> createState() => _CustomDateOfBirthFormFieldState();
}

class _CustomDateOfBirthFormFieldState extends State<CustomDateOfBirthFormField> {
  DateTime? _selectedDate;


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.controller!.text = "${picked.day}/${picked.month}/${picked.year}"; // Update text field
        widget.onChanged?.call(widget.controller!.text); // Notify parent widget with selected date
      });
    }
  }

  @override
  void dispose() {
    widget.controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller, // Set the controller for the text field
      style: TextStyle(color: Colors.black),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
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
        suffixIcon: IconButton(
          onPressed: () {
            _selectDate(context); // Show date picker on icon click
          },
          icon: Icon(Icons.calendar_today_outlined),
        ),
      ),
    );
  }
}
