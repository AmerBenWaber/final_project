import 'package:flutter/material.dart';

class CustomBoxDecoration {
  static BoxDecoration defaultBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(16.0), // حواف مستديرة
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 8.0,
          spreadRadius: 4.0, // ظل مناسب
        ),
      ],
      color: Colors.white,
    );
  }
}
