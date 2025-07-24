import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/my_theme.dart';
import 'package:untitled1/provider/app_config.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<AppConfigProvider>(context);
    return Center(
      child: Column(
        children: [
          Expanded(
              child: Center(
                  child: Image.asset('assets/images/radio-vector.png'),
              ),
          ),
          Text(
            'إذاعة القرآن الكريم',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Expanded(
            child: Center(
              child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.skip_next_rounded,
                  size: 45,
                    color: provider.isDark()?
                    MyTheme.Whitecolor:
                    Theme.of(context).primaryColor
                  ),
                  Icon(Icons.play_arrow,
                    size: 55,
                      color: provider.isDark()?
                      MyTheme.Whitecolor:
                      Theme.of(context).primaryColor
                  ),
                  Icon(Icons.skip_next_rounded,
                    size: 45,
                      color: provider.isDark()?
                      MyTheme.Whitecolor:
                      Theme.of(context).primaryColor
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
