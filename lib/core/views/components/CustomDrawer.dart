import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Color? backgroundColor;
  final List<Widget>? drawerItems;
  final Widget? header;
  final double elevation;

  const CustomDrawer({
    Key? key,
    this.backgroundColor,
    this.drawerItems,
    this.header,
    this.elevation = 16.0, // قيمة الظل الافتراضية
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: elevation,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          header ??
              DrawerHeader(
                decoration: BoxDecoration(
                  color: backgroundColor ?? Colors.blue, // اللون الافتراضي
                ),
                child: Text(
                  'Drawer Header', // عنوان افتراضي
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
          ...?drawerItems, // عناصر القائمة في Drawer
        ],
      ),
    );
  }
}
