import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class UserItem extends StatelessWidget {
  const UserItem(
      {super.key,
      required this.title,
      required this.icon,
      @required this.subtitle,
      this.onPressed});
  final String title;
  final IconData icon;
  final String? subtitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(subtitle!),
      leading: Icon(icon),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(IconlyLight.arrowRight2),
      ),
    );
  }
}
