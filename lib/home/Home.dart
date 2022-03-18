import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isalmi_c5_alex/home/ahadeth/AhadethFragment.dart';
import 'package:isalmi_c5_alex/home/quran/QuranFragment.dart';
import 'package:isalmi_c5_alex/home/radio/RadioFragment.dart';
import 'package:isalmi_c5_alex/home/sebha/SebhaFragment.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:isalmi_c5_alex/home/settings/SettingsFragment.dart';
import 'package:isalmi_c5_alex/provider/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static String ROUTE_NAME = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of(context);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(provider.mode == ThemeMode.light
                  ? 'assets/images/default_bg.png'
                  : 'assets/images/dark_bg.png'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          // centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.islami,
            style: Theme.of(context).textTheme.headline1,
          ),
          //backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Color(0xffB7935F)),
          child: BottomNavigationBar(
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            selectedItemColor: Color(0xff242424),
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                  label: 'quran',
                  icon: ImageIcon(AssetImage("assets/images/icon_quran.png"))),
              BottomNavigationBarItem(
                  label: 'ahadeth',
                  icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png"))),
              BottomNavigationBarItem(
                  label: 'tasbeh',
                  icon: ImageIcon(AssetImage("assets/images/icon_sebha.png"))),
              BottomNavigationBarItem(
                  label: 'radio',
                  icon: ImageIcon(AssetImage("assets/images/icon_radio.png"))),
              BottomNavigationBarItem(
                  label: 'settigns', icon: Icon(Icons.settings))
            ],
          ),
        ),
        body: getBody(),
      ),
    );
  }

  Widget getBody() {
    if (currentIndex == 0) {
      return QuranFragment();
    } else if (currentIndex == 1) {
      return AhadethFragment();
    } else if (currentIndex == 2) {
      return SebhaFragment();
    } else if (currentIndex == 4) {
      return SettingsFragment();
    } else {
      return RadioFragment();
    }
  }
}
