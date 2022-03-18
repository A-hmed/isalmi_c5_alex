import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isalmi_c5_alex/HadehDetails/HadethDetails.dart';
import 'package:isalmi_c5_alex/MyThemeData.dart';

class AhadethFragment extends StatefulWidget {
  @override
  State<AhadethFragment> createState() => _AhadethFragmentState();
}

class _AhadethFragmentState extends State<AhadethFragment> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    if (ahadethList.isEmpty) {
      readHadethFile();
    }
    return Container(
      child: Column(children: [
        Image.asset('assets/images/hadeth_logo.png'),
        Divider(
          color: MyThemeData.primaryColor,
          thickness: 2,
        ),
        Container(
            margin: EdgeInsets.all(8),
            child: Text(
              'Ahadeth',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            )),
        Container(
          width: double.infinity,
          height: 2,
          color: MyThemeData.primaryColor,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: ahadethList.length,
            itemBuilder: (context, index) {
              //  print(ahadethList[index].title);
              return Container(
                padding: EdgeInsets.all(8),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, HadehtDetails.ROUTE_NAME,
                        arguments: ahadethList[index]);
                  },
                  child: Text(
                    ahadethList[index].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: MyThemeData.primaryColor,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              );
            },
          ),
        )
      ]),
    );
  }

  void readHadethFile() async {
    String fileContent =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    // print(fileContent);
    List<String> ahadeth = fileContent.split("#");
    for (int i = 0; i < ahadeth.length; i++) {
      String singleHadeth = ahadeth[i].trim();
      if (singleHadeth.isEmpty) continue;
      List<String> hadethLines = singleHadeth.split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      String content = hadethLines.join();
      Hadeth hadeth = Hadeth(title, content);
      ahadethList.add(hadeth);
    }
    print('${ahadethList[ahadethList.length - 1].title} -----');
    setState(() {});
  }
}

class Hadeth {
  String title;
  String content;

  Hadeth(this.title, this.content);
}
