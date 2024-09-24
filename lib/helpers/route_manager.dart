import 'package:final_project/core/views/components/CustomTapBar.dart';
import 'package:final_project/core/views/screens/fileListScreen.dart';
import 'package:final_project/core/views/screens/homScreen.dart';
//import 'package:final_project/core/views/screens/screen1.dart';
//import 'package:final_project/core/views/screens/screen2.dart';
//import 'package:final_project/core/views/screens/screen3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteManager{
  static Route<dynamic>? generateRoute(RouteSettings settings){
    switch(settings.name){
      //case '/splash':return MaterialPageRoute(builder: (ctx)=>SplashScreen());
      // case '/login':return MaterialPageRoute(builder: (ctx)=>LoginScreen());
      // case '/products':return MaterialPageRoute(builder: (ctx)=>ResponsiveProductsScreen());
      // case '/default':return MaterialPageRoute(builder: (ctx)=>PageNotFoundScreen());
      case'/home': return MaterialPageRoute(builder: (ctx)=>HomeScreen());
      case'/FileListScreen': return MaterialPageRoute(builder: (ctx)=>FileListScreen());
      case'/Customtapbar': return MaterialPageRoute(builder: (ctx)=>Customtapbar());
      //case'/BookDetailScreen': return MaterialPageRoute(builder: (ctx)=>BookDetailScreen());
      //case'/AudioBookScreen': return MaterialPageRoute(builder: (ctx)=>AudioBookScreen());
      //case'/AudioScreen': return MaterialPageRoute(builder: (ctx)=>AudioScreen());
    }
  }
}