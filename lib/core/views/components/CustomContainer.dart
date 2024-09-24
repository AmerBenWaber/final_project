import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;

  const CustomContainer({
    super.key,
     this.child,
    this.height,
    this.width,
    this.padding,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding ?? const EdgeInsets.all(16.0), // تباعد داخلي
      decoration: decoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(12.0), // حواف مستديرة
            color: Colors.white, // اللون الافتراضي
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8.0, // ظل مناسب
                spreadRadius: 2.0,
              ),
            ],
          ),
      child: child,
    );
  }
}
