import 'package:flutter/material.dart';
import 'package:untitled1/my_theme.dart';

import 'home_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:   HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
      },
      theme: MyTheme.lighttheme,
    );
  }
}
