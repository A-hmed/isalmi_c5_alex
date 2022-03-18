import 'package:flutter/material.dart';
import 'package:isalmi_c5_alex/MyThemeData.dart';
import 'package:isalmi_c5_alex/provider/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(12),
      height: MediaQuery.of(context).size.height * .4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                provider.changeLanguage('ar');
              },
              child: getMainView('ar')),
          SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () {
                provider.changeLanguage('en');
              },
              child: getMainView('en'))
        ],
      ),
    );
  }

  Widget getMainView(String language) {
    if (provider.language == language) {
      return Row(
        children: [
          Text(
            language == 'ar' ? "العربيه" : "English",
            style: TextStyle(color: MyThemeData.primaryColor),
          ),
          Spacer(),
          Icon(
            Icons.check,
            color: MyThemeData.primaryColor,
          )
        ],
      );
    } else {
      return Text(language == 'ar' ? "العربيه" : "English");
    }
  }
}
