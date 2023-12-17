import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  CustomBotton({super.key, required this.title ,required this.onPressed});
  final String title;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom( 
        // Text (label) color
     elevation: 4,    
     backgroundColor: Colors.black,       // Shadow elevation
     shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0), // Border radius
    ),
    padding: EdgeInsets.all(16), // Button padding
  ),

      onPressed: onPressed,
      child: Text(title),
    );
  }
}
