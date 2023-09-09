import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/quran/item_sura_details.dart';

import '../my_theme.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName='sura-detail';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses=[];

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
  if(verses.isEmpty){
    Loadfile(args.index);
  }

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
             '${args.name}',
            style: MyTheme.lighttheme.textTheme.titleLarge,
      ),
     ),
         body:verses.length==0?
             CircularProgressIndicator()
         :
         Container(
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(25),
             color: MyTheme.Whitecolor,
           ),
           margin: EdgeInsets.symmetric(
             horizontal:MediaQuery.of(context).size.width *0.05 ,
             vertical: MediaQuery.of(context).size.height *0.08
           ),
           padding: EdgeInsets.all(2),
           child: ListView.separated(
             separatorBuilder: (context,index){
               return  Divider(
                 color: Theme.of(context).primaryColor,
                 thickness: 2,
               );
             },
               itemBuilder:(context, index){
                 return ItemSuraDetails(content:verses[index],index: index,);
               },
             itemCount: verses.length,
           ),
         ) ,
    ),
  ],
       );

  }

  void Loadfile(int index)async{
   String content=await rootBundle.loadString('assets/file/${index+1}.txt');
   List<String>lines=content.split('\n');
   verses = lines;
  setState(() {

  });
  }
}
class SuraDetailsArgs{
  String name;
  int index;
  SuraDetailsArgs({required this.name,required this.index});
}
