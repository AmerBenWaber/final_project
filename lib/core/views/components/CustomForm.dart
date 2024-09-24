import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  // Default values based on global standards
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final double fieldSpacing;
  final List<Widget> children; // List of Widgets to be added to the form

  // Constructor with default values and formFields parameter
  CustomForm({
    this.padding = const EdgeInsets.all(16.0), // Global standard padding
    this.backgroundColor = Colors.grey, // Light background for better contrast
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)), // Smooth rounded corners
    this.fieldSpacing = 10.0, // Standard space between form fields
    required this.children,
    super.key,// Required list of form widgets
  });

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: widget.borderRadius,
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Iterate over the formFields and add spacing between them
            for (var child in widget.children) ...[
              child,
              SizedBox(height: widget.fieldSpacing),
            ],
          ],
        ),
      ),
    );
  }
}