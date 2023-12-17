import 'package:ecommerce/Features/BottomNavigator/presentation/view/widget/bottom_nav_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavBar(),
    );
  }
}