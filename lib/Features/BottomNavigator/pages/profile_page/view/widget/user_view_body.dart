import 'package:ecommerce/Features/BottomNavigator/pages/profile_page/view/widget/UserHeaderTitle.dart';
import 'package:ecommerce/Features/BottomNavigator/pages/profile_page/view/widget/userlist.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserViewBody extends StatefulWidget {
  const UserViewBody({super.key});

  @override
  State<UserViewBody> createState() => _UserViewBodyState();
}

class _UserViewBodyState extends State<UserViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.07),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: UserHeaderTitle(),
          ),
          userListItem(),
        ],
      ),
    );
  }
}
