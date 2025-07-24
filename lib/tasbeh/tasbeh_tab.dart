import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/my_theme.dart';
import 'package:untitled1/provider/app_config.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter = 0;
  int index = 0;
  List<String> tasbeh = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
    "لا اله الا الله",
    "لا اله الا أنت سيحانك أني كنت من الظالمين",
    "لا حول ولا قوة الا بالله العلي العظيم",
    "اللهم صلي علي سيدنا محمد",
    "سبحان الله وبحمده",
    "سبحان الله العظيم",
  ];
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    if (counter == 33 ||
        counter == 66 ||
        counter == 99 ||
        counter == 133 ||
        counter == 166 ||
        counter == 200 ||
        counter == 233 ||
        counter == 266 ||
        counter == 300) {
      index++;

    }
    if(counter==300){
      index=0;
    }


    return Center(
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Stack(

              children:[
                Positioned(
                  width: 73,
                  height: 105,
                  top: 15,
                  left: 190,
                  child: Image.asset('assets/images/head_of_seb7a.png',

                ),
                ),
                Positioned(
                  width: 232,
                  height: 234,
                  top: 90,
                  left: 90,
                  child: InkWell(
                      onTap: () {
                        counter++;
                        setState(() {});
                      },
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset('assets/images/body_of_seb7a.png')),
                ),
              ],
              ),
          ),


          Expanded(
            flex: 2,
            child: Text(
              'عدد التسبيحات',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),

          Expanded(

            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xff948080),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                '$counter',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
        Spacer(),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color:provider.isDark()?
                MyTheme.yellowcolor:
              Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Text(
                '${tasbeh[index]}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
