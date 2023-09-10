import 'package:flutter/material.dart';

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
  ];
  @override
  Widget build(BuildContext context) {
    if (counter == 33 ||
        counter == 66 ||
        counter == 99 ||
        counter == 133 ||
        counter == 166 ||
        counter == 200 ||
        counter == 233) {
      index++;

    }

    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/head_of_seb7a.png'),
          InkWell(
              onTap: () {
                counter++;
                setState(() {});
              },
              borderRadius: BorderRadius.circular(25),
              child: Image.asset('assets/images/body_of_seb7a.png')),
          SizedBox(
            height: 20,
          ),
          Text(
            'عدد التسبيحات',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Container(
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
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Text(
              '${tasbeh[index]}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
