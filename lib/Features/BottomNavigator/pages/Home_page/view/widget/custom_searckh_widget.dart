import 'package:flutter/material.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffececec),
          borderRadius: BorderRadiusDirectional.circular(12)),
      // Add padding around the search bar
      padding: const EdgeInsets.symmetric(horizontal: 8.0),

      // Use a Material design search bar

      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search...',
            // Add a clear button to the search bar
            suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: () {}),
            // Add a search icon or button to the search bar
            prefixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Perform the search here
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            )),
      ),
    );
  }
}
