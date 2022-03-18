import 'package:flutter/material.dart';
import 'package:isalmi_c5_alex/MyThemeData.dart';
import 'package:isalmi_c5_alex/provider/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
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
                provider.changeTheme(ThemeMode.light);
              },
              child: getMainView('light')),
          SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
              },
              child: getMainView('dark'))
        ],
      ),
    );
  }

  Widget getMainView(String mode) {
    ThemeMode newMode = mode == 'light' ? ThemeMode.light : ThemeMode.dark;
    if (provider.mode == newMode) {
      return Row(
        children: [
          Text(
            mode,
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
      return Text(mode);
    }
  }
}
