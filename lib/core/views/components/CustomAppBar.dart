import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final Widget? leading;
  final double elevation;
  final TextStyle? titleTextStyle;
  final bool centerTitle; // إضافة التحكم بمركزية العنوان
  final IconThemeData? iconTheme; // لتخصيص مظهر الأيقونات
  final Widget? flexibleSpace; // لإضافة محتوى مرن خلف الـ AppBar

  const CustomAppBar({
    Key? key,
    this.title,
    this.backgroundColor,
    this.actions,
    this.leading,
    this.elevation = 4.0, // القيمة الافتراضية لظل التطبيق
    this.titleTextStyle,
    this.centerTitle = true, // القيمة الافتراضية لمركزية العنوان
    this.iconTheme,
    this.flexibleSpace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      title: Text(
        title ?? 'App Title', // عنوان افتراضي
        style: titleTextStyle ?? theme.textTheme.titleLarge?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ), // استخدام النمط الافتراضي من الثيم
      ),
      backgroundColor: backgroundColor ?? theme.primaryColor, // لون افتراضي أو لون الثيم الأساسي
      elevation: elevation, // الظل الافتراضي
      leading: leading, // أيقونة قيادة (مثل القائمة)
      actions: actions, // أيقونات العمل (مثل البحث أو الإعدادات)
      centerTitle: centerTitle, // التحكم بمركزية العنوان
      iconTheme: iconTheme ?? theme.iconTheme.copyWith(color: Colors.white), // تخصيص الأيقونات أو استخدام الافتراضي
      flexibleSpace: flexibleSpace, // إضافة محتوى مرن خلف الـ AppBar
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
