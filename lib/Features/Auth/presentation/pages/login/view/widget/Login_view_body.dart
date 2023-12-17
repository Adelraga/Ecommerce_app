import 'package:ecommerce/Features/Auth/presentation/pages/login/view/widget/custom_login_form.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [
            Colors.orange.shade900,
            Colors.orange.shade800,
            Colors.orange.shade400,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                SizedBox(height: 10),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8), fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35),
                  topLeft: Radius.circular(35),
                ),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 164, 146, 128),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: Offset(0, 0)),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(child: CustomLoginForm()),
              ),
            ),
          )
        ],
      ),
    );
  }
}
