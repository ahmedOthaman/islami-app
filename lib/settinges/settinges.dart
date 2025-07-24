import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/provider/app_config.dart';
import 'package:untitled1/settinges/theme_Bottom_sheet.dart';

import 'language_Bottom_sheet.dart';
class SettingesTab extends StatefulWidget {


  @override
  State<SettingesTab> createState() => _SettingesTabState();
}

class _SettingesTabState extends State<SettingesTab> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
          style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: (){
              showLanguageModeBuner();
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.applanguage=='en'?
                    AppLocalizations.of(context)!.english
                    :AppLocalizations.of(context)!.arabic
                    ,

                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: (){
              showThemeModeBuner();
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.isDark()?
                    AppLocalizations.of(context)!.dark :
                    AppLocalizations.of(context)!.light
                    ,

                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageModeBuner() {
    showModalBottomSheet(
        context: context,
        builder: (context)=>LanguageBottomSheet(),
    );
  }

  void showThemeModeBuner() {
    showModalBottomSheet(
        context: context,
        builder:(context)=>ThemeBottomSheet() ,
    );
  }
}
