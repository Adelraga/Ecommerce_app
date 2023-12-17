import 'package:ecommerce/Features/Auth/presentation/pages/login/view/widget/Login_view_body.dart';
import 'package:ecommerce/Features/Auth/presentation/pages/SignUp/view/widget/Logout_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpViewBody(),
    );
  }
}
