import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final double? elevation;
  final EdgeInsetsGeometry? margin;
  final ShapeBorder? shape;
  final Color? color;

  const CustomCard({
    Key? key,
    required this.child,
    this.elevation,
    this.margin,
    this.shape,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 6.0, // قيمة افتراضية للارتفاع
      margin: margin ?? const EdgeInsets.all(16.0), // تباعد عالمي
      shape: shape ?? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // حواف مستديرة وفق المعايير
      ),
      color: color ?? Theme.of(context).cardColor, // اللون الافتراضي للتصميم
      child: child,
    );
  }
}
