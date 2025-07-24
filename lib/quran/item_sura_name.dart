import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/my_theme.dart';
import 'package:untitled1/quran/sura_details_screen.dart';

import '../provider/app_config.dart';

class ItemSuraName extends StatelessWidget {
 String name;
 int index;
 ItemSuraName({required this.name,required this.index});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(SuraDetails.routeName,
        arguments:SuraDetailsArgs(
            name: name,
            index:index,
        ),
        );
      },
      child: Text(
        name,
        style:provider.isDark()?
        Theme.of(context).textTheme.titleSmall!.copyWith(
          color: MyTheme.Whitecolor
        ):
        Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
