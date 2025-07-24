import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/hadeth/hadeth_tab.dart';
import 'package:untitled1/provider/app_config.dart';
import 'package:untitled1/quran/quran_tab.dart';
import 'package:untitled1/settinges/settinges.dart';
import 'package:untitled1/tasbeh/tasbeh_tab.dart';
import 'package:untitled1/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'radio/radio_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName='home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int selectedindex=1;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Stack(
    children: [provider.isDark()?
      Image.asset('assets/images/bg_dark.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      )
       : Image.asset('assets/images/main_background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
    ),
      Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.app_title,
         style: MyTheme.darktheme.textTheme.titleLarge!.copyWith(
             color: provider.isDark()?
             MyTheme.Whitecolor
                 :MyTheme.blackcolor
         ),
        ),
      ),
        bottomNavigationBar:Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).primaryColor,
          ),

          child: BottomNavigationBar(
            currentIndex:selectedindex ,
            onTap: (index){
              selectedindex=index;
              setState(() {

              });
            },
            items: [
              BottomNavigationBarItem(
                icon:ImageIcon(AssetImage('assets/images/icon_quran.png',),

                ),
                label:  AppLocalizations.of(context)!.quran,
              ),
              BottomNavigationBarItem(
                icon:ImageIcon(AssetImage('assets/images/icon_hadeth.png',),

                ),
                label: AppLocalizations.of(context)!.hadeth,
              ),
              BottomNavigationBarItem(
                icon:ImageIcon(AssetImage('assets/images/icon_sebha.png',),

                ),
                label: AppLocalizations.of(context)!.sebha,
              ),

              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/icon_radio.png'),
                ),
                label:  AppLocalizations.of(context)!.radio,
              ),

              BottomNavigationBarItem(
              icon:Icon(Icons.settings),
              label:  AppLocalizations.of(context)!.settinges,
              ),
            ],
          ),
        ),

        body: tabs[selectedindex],
      ),
    ],
    );
  }
  List<Widget>tabs=[
    QuranTab() ,HadethTab(),TasbehTab(),RadioTab(),SettingesTab()
  ];
}
