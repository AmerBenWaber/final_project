import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;

  const CustomCircleAvatar({
    Key? key,
    required this.imageUrl,
    this.radius = 50.0, // نصف قطر افتراضي
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(imageUrl),
      radius: radius,
    );
  }
}
