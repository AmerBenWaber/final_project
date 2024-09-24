import 'package:final_project/core/view_models/fileViewModel.dart';
import 'package:final_project/helpers/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FileViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Files App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      //home: const FileListScreen(),

      initialRoute: '/Customtapbar',
      onGenerateRoute:RouteManager.generateRoute ,

    );
  }
}
