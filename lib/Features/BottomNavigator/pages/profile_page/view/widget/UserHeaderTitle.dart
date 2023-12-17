
import 'package:ecommerce/core/text_widget.dart';
import 'package:flutter/material.dart';


class UserHeaderTitle extends StatelessWidget {
  const UserHeaderTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            TextWidget(
              text: "Hi,",
              isTitle: true,
              color: Colors.blueAccent,
              textSize: 25,
            ),
            TextWidget(
              text: " Adel",
              isTitle: true,
              textSize: 28,
            ),
          ],
        ),
        TextWidget(
          text: "ar3636@gmail.com",
          isTitle: true,
          color: Colors.grey,
          textSize: 15,
        ),
      ],
    );
  }
}
