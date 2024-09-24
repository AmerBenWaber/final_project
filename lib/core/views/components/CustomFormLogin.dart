import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  final Color formBackgroundColor;
  final double fieldPadding;
  final EdgeInsetsGeometry fieldMargin;
  final TextStyle labelTextStyle;
  final TextStyle inputTextStyle;

  // Constructor with default values
  CustomForm({
    this.formBackgroundColor = Colors.white,
    this.fieldPadding = 8.0,
    this.fieldMargin = const EdgeInsets.symmetric(vertical: 8.0),
    this.labelTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Color(333333),
    ),
    this.inputTextStyle = const TextStyle(
      fontSize: 14,
      color: Colors.black87,
      fontWeight: FontWeight.normal
    ),
  });

  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.formBackgroundColor,
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(widget.fieldPadding),
              child: TextFormField(
                style: widget.inputTextStyle,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: widget.labelTextStyle,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: widget.fieldMargin,
              child: TextFormField(
                style: widget.inputTextStyle,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: widget.labelTextStyle,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}