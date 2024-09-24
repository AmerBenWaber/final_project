import 'package:flutter/material.dart';

class CustomThemeData {
  // الألوان الافتراضية
  static const Color _primaryColor = Colors.blue;
  static const Color _accentColor = Colors.amber;
  static const Color _backgroundColor = Colors.white;
  static const Color _errorColor = Colors.red;

  // إعداد `ThemeData` مخصص
  static ThemeData get theme {
    return ThemeData(
      primaryColor: _primaryColor,
      hintColor: _accentColor,
      cardColor: _errorColor,
      scaffoldBackgroundColor: _backgroundColor,
      brightness: Brightness.light,

      // إعداد الـ AppBar
      appBarTheme: AppBarTheme(
        color: _primaryColor,
        elevation: 4,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),

      // إعداد الـ Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: _primaryColor, // لون النص
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // حواف دائرية
          ),
        ),
      ),

      // إعداد النصوص
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
        displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: Colors.black),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black54),
        labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),

      // إعداد الـ InputField
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: _primaryColor,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: _errorColor,
            width: 2.0,
          ),
        ),
        hintStyle: TextStyle(
          color: Colors.grey[500],
        ),
      ),

      // إعداد الأيقونات
      iconTheme: IconThemeData(
        color: _primaryColor,
        size: 24,
      ), colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: _primaryColor,
        secondary: _accentColor,
        error: _errorColor,
        background: _backgroundColor,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
      ).copyWith(background: _backgroundColor),
    );
  }

  // إنشاء `ThemeData` مخصص آخر مع القيم القابلة للتعديل
  static ThemeData customTheme({
    Color? primaryColor,
    Color? accentColor,
    Color? backgroundColor,
    Color? errorColor,
    Brightness? brightness,
    double? appBarElevation,
    double? buttonBorderRadius,
    TextStyle? headline1Style,
    TextStyle? buttonTextStyle,
    InputDecorationTheme? inputDecorationTheme,
  }) {
    return ThemeData(
      primaryColor: primaryColor ?? _primaryColor,
      hintColor: accentColor ?? _accentColor,
      cardColor: errorColor ?? _errorColor,
      brightness: brightness ?? Brightness.light,

      // تعديل الـ AppBar حسب المدخلات
      appBarTheme: AppBarTheme(
        color: primaryColor ?? _primaryColor,
        elevation: appBarElevation ?? 4.0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),

      // تعديل الـ Button حسب المدخلات
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: primaryColor ?? _primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonBorderRadius ?? 8.0),
          ),
        ),
      ),

      // تعديل الـ Text حسب المدخلات
      textTheme: TextTheme(
        displayLarge: headline1Style ?? const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
        labelLarge: buttonTextStyle ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),

      // تعديل الحقول النصية InputFields حسب المدخلات
      inputDecorationTheme: inputDecorationTheme ??
          InputDecorationTheme(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: primaryColor ?? _primaryColor,
                width: 2.0,
              ),
            ),
          ), colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: primaryColor ?? _primaryColor,
        secondary: accentColor ?? _accentColor,
        error: errorColor ?? _errorColor,
        background: backgroundColor ?? _backgroundColor,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
      ).copyWith(background: backgroundColor ?? _backgroundColor),
    );
  }
}
