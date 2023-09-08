import 'package:flutter/material.dart';

class MyTheme{
 static Color blackcolor=Color(0xff242424);
 static Color praimarylight=Color(0xffB7935F);
 static Color Whitecolor=Colors.white;
 static ThemeData lighttheme=ThemeData(
    primaryColor: praimarylight,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textTheme: TextTheme(
     titleLarge: TextStyle(
       fontSize: 30,
       fontWeight: FontWeight.w700,
       color:blackcolor,
     ),
    ),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
     selectedItemColor: blackcolor,
     unselectedItemColor:Whitecolor, 
   ),
  );
}