import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/hadeth/hadeth_tab.dart';
import 'package:untitled1/hadeth/item_hadeth_details.dart';
import 'package:untitled1/provider/app_config.dart';
import 'package:untitled1/quran/item_sura_details.dart';

import '../my_theme.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName='dadeth-detail';

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {


  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    var args=ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Stack(
      children: [
        provider.isDark()?
        Image.asset('assets/images/bg_dark.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        )
            :  Image.asset('assets/images/main_background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
             args.title,
              style: MyTheme.darktheme.textTheme.titleLarge!.copyWith(
                  color:provider.isDark()?
                       MyTheme.Whitecolor
                      :MyTheme.blackcolor
              ),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: provider.isDark()?
              MyTheme.praimarydark:
              MyTheme.Whitecolor,
            ),
            margin: EdgeInsets.symmetric(
              horizontal:MediaQuery.of(context).size.width *0.05 ,
              vertical: MediaQuery.of(context).size.height *0.08,
            ),
            padding: EdgeInsets.all(2),
            child: ListView.builder(
              itemBuilder:(context, index){
                return ItemHadethDetails(content:args.content[index]);
              },
              itemCount: args.content.length,
            ),
          ) ,
        ),
      ],
    );

  }
  }
