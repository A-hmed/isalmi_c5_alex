import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isalmi_c5_alex/MyThemeData.dart';
import 'package:isalmi_c5_alex/SuraDetails/SuraVerse.dart';
import 'package:isalmi_c5_alex/home/quran/SuraName.dart';

class SuraDetails extends StatefulWidget {
  static String ROUTE_NAME = 'sura details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String suraContent = '';
  List<String> suraLines = [];

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args =
        ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (suraContent.isEmpty) {
      readSuraFile(args.fileName);
    }
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/default_bg.png'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            args.suraName,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: suraContent.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Container(
                child: ListView.separated(
                itemCount: suraLines.length,
                itemBuilder: (context, index) {
                  return SuraVerse(suraLines[index], index);
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: MyThemeData.primaryColor,
                    thickness: 2,
                  );
                },
              )),
      ),
    );
  }

  void readSuraFile(String fileName) async {
    String fileContent = await rootBundle.loadString('assets/files/$fileName');
    suraContent = fileContent;
    suraContent = suraContent.trim();
    suraLines = suraContent.split('\n');
    setState(() {});
  }
}
