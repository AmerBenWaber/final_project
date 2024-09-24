import 'package:flutter/material.dart';

class CustomMargin extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry margin;

  const CustomMargin({
    Key? key,
    required this.child,
    this.margin = const EdgeInsets.all(16.0), // تباعد خارجي عالمي
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: child,
    );
  }
}
