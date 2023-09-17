import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/my_theme.dart';
import 'package:untitled1/provider/app_config.dart';
class ThemeBottomSheet extends StatefulWidget {


  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: (){
         provider.changeThemeMode(ThemeMode.dark);
          },
          child:provider.isDark()?
          getSlectedItemwidget(AppLocalizations.of(context)!.dark)
          :getUnslectedItemwidget(AppLocalizations.of(context)!.dark)
          ,
        ),
        InkWell(
          onTap: (){
            provider.changeThemeMode(ThemeMode.light);
          },
          child:provider.isDark()?

          getUnslectedItemwidget(AppLocalizations.of(context)!.light):
          getSlectedItemwidget(AppLocalizations.of(context)!.light)
            ,
        ),
      ],
    );
  }

Widget getSlectedItemwidget(String text){
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Text(text,
             style: Theme.of(context).textTheme.titleMedium!.copyWith(
               color: Theme.of(context).primaryColor,
             )
         ),
         Icon(Icons.check,color: Theme.of(context).primaryColor,size: 30,),
       ],
     ),
   );
}
Widget getUnslectedItemwidget(String text){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: MyTheme.praimarylight
        ),
      ),
    );
  }
}