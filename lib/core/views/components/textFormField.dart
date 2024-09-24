import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final InputDecoration? inputDecoration;
  final TextStyle? textStyle;

  const CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text, // نوع الإدخال الافتراضي
    this.obscureText = false, // النص غير مرئي بشكل افتراضي
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.inputDecoration,
    this.textStyle, required bool? isPassword,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      style: widget.textStyle ??
          TextStyle(
            fontSize: 16.0, // حجم النص الافتراضي
            color: Colors.black, // اللون الافتراضي للنص
          ),
      decoration: widget.inputDecoration ??
          InputDecoration(
            labelText: widget.labelText, // النص الذي يظهر أعلى الحقل
            hintText: widget.hintText, // النص الذي يظهر داخل الحقل
            prefixIcon: widget.prefixIcon, // أيقونة قبل النص
            suffixIcon: widget.suffixIcon, // أيقونة بعد النص
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0), // حواف مستديرة
              borderSide: BorderSide(
                color: Colors.grey, // اللون الافتراضي لحواف الحقل
                width: 1.0, // عرض الحواف
              ),
            ),
            filled: true,
            fillColor: Colors.grey[200], // لون خلفية الحقل
            contentPadding: EdgeInsets.symmetric(
              vertical: 14.0,
              horizontal: 16.0, // تباعد داخلي
            ),
          ),
      validator: widget.validator,
    );
  }
}
