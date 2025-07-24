import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/hadeth/item_hadeth_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled1/my_theme.dart';
import 'package:untitled1/provider/app_config.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
List<Hadeth> ahadethList=[];

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    if(ahadethList.isEmpty){
      loadHadethfile();
    }
    return  Column(
      children: [
        Expanded(
            flex: 2,
            child: Center(child: Image.asset('assets/images/hadeth_logo.png'))),
        Divider(
          color: provider.isDark()?
          MyTheme.yellowcolor:
              MyTheme.praimarylight
          ,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          color:provider.isDark()?
            MyTheme.yellowcolor:
            MyTheme.praimarylight,
          thickness: 3,
        ),
        ahadethList.isEmpty ?
            Center(
                child: CircularProgressIndicator(
                  color: provider.isDark()?
                    MyTheme.yellowcolor:
                    MyTheme.praimarylight
                    ,
                ))
        :
        Expanded(
          flex: 3,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ItemHadethName(hadeth: ahadethList[index],);
            },
            itemCount: ahadethList.length,
          ),
        ),
      ],
    );
  }

  void loadHadethfile()async{
  String ahadethContent= await rootBundle.loadString('assets/file/ahadeth.txt');
   List<String>hadethlist= ahadethContent.split('#\r\n');
   for(int i=0;i<hadethlist.length;i++){
    List<String> hadethLines=hadethlist[i].split('\n');
    String title=hadethLines[0];
    hadethLines.removeAt(0);
   Hadeth hadeth=Hadeth(title:title,content:hadethLines);
   ahadethList.add(hadeth);
   setState(() {

   });
   }

  }
}
//data class
class Hadeth{
  String title;
  List<String>content;
  Hadeth({required this.title,required this.content});
}
