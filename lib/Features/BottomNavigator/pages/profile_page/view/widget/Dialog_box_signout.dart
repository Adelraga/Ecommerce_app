import 'package:flutter/material.dart';

import 'CustomTextField.dart';
import 'Custom_buttom.dart';

class DialogBoxItemSignOut extends StatelessWidget {
  DialogBoxItemSignOut({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      content: Container(
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                "Sign Out",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                "Do you wanna Sign Out?",
                style: TextStyle(fontSize: 19),
              ),
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
                      title: "Ok",
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomBotton(
                      title: "Cancel",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
