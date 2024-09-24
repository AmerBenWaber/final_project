import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Color? borderColor; // إمكانية تخصيص لون الحدود
  final double? borderRadius; // إمكانية تخصيص زوايا الحواف

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.borderColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0), // زوايا الحواف الافتراضية
          borderSide: BorderSide(
            color: borderColor ?? Theme.of(context).primaryColor, // لون الحدود الافتراضي
          ),
        ),
      ),
    );
  }
}
