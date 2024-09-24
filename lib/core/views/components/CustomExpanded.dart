import 'package:flutter/material.dart';

class CustomExpanded extends StatelessWidget {
  final Widget child;
  final int flex;

  const CustomExpanded({
    Key? key,
    required this.child,
    this.flex = 1, // استخدام القيمة الافتراضية القياسية
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: child,
    );
  }
}
