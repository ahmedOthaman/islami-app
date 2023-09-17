import 'package:flutter/material.dart';
import 'package:untitled1/hadeth/hadeth_details_screen.dart';
import 'package:untitled1/my_theme.dart';
import 'package:untitled1/provider/app_config.dart';
import 'package:untitled1/quran/sura_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'home_screen.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(ChangeNotifierProvider(
    create:(context)=>AppConfigProvider(),
      child: MyApp()));
}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:   HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
        SuraDetails.routeName:(context)=>SuraDetails(),
        HadethDetails.routeName:(context)=>HadethDetails(),
      },

      theme: MyTheme.lighttheme,
      darkTheme: MyTheme.darktheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.applanguage),
      themeMode: provider.apptheme,

    );
  }
}
