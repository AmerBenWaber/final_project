import 'package:flutter/material.dart';

class CustomPadding extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const CustomPadding({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // تباعد عالمي
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: child,
    );
  }
}
