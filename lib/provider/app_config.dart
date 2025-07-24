import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  String applanguage ='en';
ThemeMode apptheme=ThemeMode.dark;
void changeLanguage(String newLanguage){
  if(applanguage==newLanguage){
    return ;
  }
  applanguage=newLanguage;
  notifyListeners();
}
void changeThemeMode(ThemeMode newmode){
  if(apptheme==newmode){
    return ;
  }
  apptheme=newmode;
  notifyListeners();

}

  bool isDark(){
    return apptheme==ThemeMode.dark;
   }
  }
