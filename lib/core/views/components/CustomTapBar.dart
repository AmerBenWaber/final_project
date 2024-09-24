import 'package:flutter/material.dart';

class Customtapbar extends StatelessWidget {
  const Customtapbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: [
          SizedBox(height: 50,),
          DefaultTabController(
            length: 4,
            child: TabBar(
                labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey.shade300,
            indicatorColor: Colors.black,
            tabs: [
            Tab(text: "العقيده"),
            Tab(text: "الحديث"),
            Tab(text: "الفقه"),
            Tab(text: "السيرة"),
            ],),
          ),
        ],
      ),
    );
  }
}
