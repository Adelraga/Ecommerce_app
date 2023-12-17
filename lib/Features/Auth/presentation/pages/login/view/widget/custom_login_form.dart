import 'package:ecommerce/Features/Auth/presentation/pages/login/view/widget/customForm.dart';
import 'package:flutter/material.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: CutomForm()
        ),
      ],
    );
  }
}
