import 'package:flutter/material.dart';
import 'package:isalmi_c5_alex/home/settings/LanguageBottomSheet.dart';
import 'package:isalmi_c5_alex/home/settings/ThemeBottomSheet.dart';
import 'package:isalmi_c5_alex/provider/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class SettingsFragment extends StatefulWidget {
  @override
  State<SettingsFragment> createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Language',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: showLanguageBottom,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Row(
                children: [
                  Text(
                    provider.language == 'ar' ? "العربيه" : "English",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_downward_outlined,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
          Text('Mode',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline2),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: showThemeBottomSheet,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Row(
                children: [
                  Text(
                    'Theme',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_downward_outlined,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottom() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        });
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ThemeBottomSheet();
        });
  }
}
