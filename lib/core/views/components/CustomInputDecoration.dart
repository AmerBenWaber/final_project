import 'package:flutter/material.dart';

class CustomInputDecoration {
  static InputDecoration defaultInputDecoration(String hintText) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0), // حواف مستديرة للحقل
      ),
      hintText: hintText,
      filled: true,
      fillColor: Colors.grey[200], // لون خلفية حقل الإدخال
      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // تباعد داخلي
    );
  }
}
