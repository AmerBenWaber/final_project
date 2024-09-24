import 'package:final_project/core/views/components/CustomText.dart';
import 'package:final_project/core/views/components/CustomTextStyle.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text; // نص الزر
  final VoidCallback onPressed; // دالة تُنفذ عند الضغط
  final Color? color; // لون الخلفية، اختياري
  final double borderRadius; // زوايا الحواف الافتراضية
  final TextStyle? textStyle; // نمط النص، اختياري

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.borderRadius = 8.0, // قيمة افتراضية للحواف
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(

        backgroundColor: color ?? Theme.of(context).primaryColor, // استخدام اللون الافتراضي من الثيم
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius), // الحواف الافتراضية أو المخصصة
        ),
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Padding لتحسين مظهر الزر
      ),
      onPressed: onPressed,
      child: CustomText(text: "Submit", style: CustomTextStyle.headline1(context)),
    );
  }
}
