import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:isalmi_c5_alex/HadehDetails/HadethDetails.dart';
import 'package:isalmi_c5_alex/MyThemeData.dart';
import 'package:isalmi_c5_alex/SuraDetails/SuraDetails.dart';
import 'package:isalmi_c5_alex/home/Home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:isalmi_c5_alex/provider/AppConfigProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  String language = 'en';

  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of(context);
    return MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        title: 'Flutter Demo',
        theme: MyThemeData.LIGHT_THEME,
        darkTheme: MyThemeData.DARK_THEME,
        themeMode: provider.mode,
        supportedLocales: [Locale('en'), Locale('ar')],
        locale: Locale(provider.language),
        routes: {
          Home.ROUTE_NAME: (context) => Home(),
          SuraDetails.ROUTE_NAME: (context) => SuraDetails(),
          HadehtDetails.ROUTE_NAME: (context) => HadehtDetails()
        },
        initialRoute: Home.ROUTE_NAME);
  }
}
