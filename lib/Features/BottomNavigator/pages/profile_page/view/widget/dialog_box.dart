import 'package:flutter/material.dart';

import 'CustomTextField.dart';
import 'Custom_buttom.dart';

class DialogBoxItem extends StatelessWidget {
  DialogBoxItem({
    super.key,
    required this.onChanged, this.controller,
  });

  VoidCallback onChanged;
    final controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      content: Container(
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                "Update",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 19,
              ),
              CustomTextField( controller: controller),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    CustomBotton(
                      title: "Update",
                      onPressed: onChanged,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
