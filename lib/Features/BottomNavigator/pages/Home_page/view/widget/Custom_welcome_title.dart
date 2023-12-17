import 'package:flutter/material.dart';

class welcome_widget extends StatelessWidget {
  const welcome_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "WelCome",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "👋",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Text(
          "Enjoy and buy with trust .",
          style: TextStyle(color: Color(0xff9C9C9C), fontSize: 13),
        ),
      ],
    );
  }
}
