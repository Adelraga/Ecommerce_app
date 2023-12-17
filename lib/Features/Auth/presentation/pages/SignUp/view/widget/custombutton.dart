import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Custombutton extends StatelessWidget {
  Custombutton({required this.btnname, required this.pressed, required this.width, required this.height, required this.backgroundColor});
  String? btnname;
  final Function()? pressed;
  final double width;
  final double height;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          minimumSize: Size(width, height)),
      child: Text(
        btnname!,
        style:
            TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 24),
      ),
    );
  }
}
