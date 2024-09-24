import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final VoidCallback onTap;

  const CustomListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon, size: 32.0), // حجم أيقونة مناسب
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)), // حجم وخط العنوان
      subtitle: Text(subtitle, style: TextStyle(fontSize: 14.0)), // حجم النص
      trailing: Icon(trailingIcon, size: 24.0), // حجم أيقونة التريلينغ
      onTap: onTap,
    );
  }
}
