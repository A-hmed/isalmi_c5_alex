import 'package:flutter/material.dart';
import 'package:isalmi_c5_alex/SuraDetails/SuraDetails.dart';

class SuraName extends StatelessWidget {
  int index;
  String suraName;

  SuraName(this.suraName, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetails.ROUTE_NAME,
            arguments: SuraDetailsArgs(suraName, '${index + 1}.txt'));
      },
      child: Container(
        child: Text(
          suraName,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
    );
  }
}

class SuraDetailsArgs {
  String suraName;
  String fileName;

  SuraDetailsArgs(this.suraName, this.fileName);
}
