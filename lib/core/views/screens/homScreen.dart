import 'package:final_project/core/views/components/CustomAppBar.dart';
import 'package:final_project/core/views/components/CustomButton.dart';
import 'package:final_project/core/views/components/CustomContainer.dart';
import 'package:final_project/core/views/components/CustomDrawer.dart';
import 'package:final_project/core/views/components/CustomForm.dart';
import 'package:final_project/core/views/components/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Custom AppBar',
        backgroundColor: Colors.green,
        centerTitle: false,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () =>CustomDrawer(),),
        actions: [Icon(Icons.search), Icon(Icons.settings)],
        titleTextStyle: TextStyle(color: Colors.yellow, fontSize: 22),
        elevation: 6.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomContainer (
                child: SingleChildScrollView(
                  child: CustomForm(
                    backgroundColor: Colors.greenAccent,
                    key: _formKey,

                    children: [
                      CustomTextFormField(
                        hintText: 'Enter your email',
                        labelText: 'Email',
                        controller: _controller,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(Icons.email),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        }, isPassword: null,
                      ),

                      // const SizedBox(height: 16.0),
                       CustomTextFormField(
                        hintText: 'Enter your password',
                        labelText: 'Password',
                        controller: _controller2,
                        isPassword: true,
                        prefixIcon: Icon(Icons.lock),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),

                      Center(child: CustomButton(
                        text: "Submit",
                        onPressed: (){
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')),
                            );
                          }
                      },
                        color: Colors.white,textStyle: TextStyle(),)),

                    ],

                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
