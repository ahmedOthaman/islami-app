import 'package:flutter/material.dart';
import 'package:untitled1/hadeth/hadeth_tab.dart';
import 'package:untitled1/quran/quran_tab.dart';
import 'package:untitled1/tasbeh/tasbeh_tab.dart';
import 'package:untitled1/my_theme.dart';

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
    return Stack(
    children: [
      Image.asset('assets/images/main_background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
      appBar: AppBar(
        title: Text(
          'Islami',
         style: MyTheme.lighttheme.textTheme.titleLarge,
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
                icon: ImageIcon(AssetImage('assets/images/icon_radio.png'),
                ),
                label: 'Radio',
              ),
              BottomNavigationBarItem(
                icon:ImageIcon(AssetImage('assets/images/icon_sebha.png',),

                ),
                label: 'Tasbeh',
              ),

              BottomNavigationBarItem(
                icon:ImageIcon(AssetImage('assets/images/icon_hadeth.png',),

                ),
                label: 'Hadeth',
              ),
              BottomNavigationBarItem(
                icon:ImageIcon(AssetImage('assets/images/icon_quran.png',),

                ),
                label: 'Quran',
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
    RadioTab(),TasbehTab(),HadethTab(),QuranTab()
  ];
}
