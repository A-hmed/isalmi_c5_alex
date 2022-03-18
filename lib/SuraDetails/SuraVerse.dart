import 'package:flutter/material.dart';

class SuraVerse extends StatelessWidget {
  int index;
  String verse;

  SuraVerse(this.verse, this.index);

  @override
  Widget build(BuildContext context) {
    verse = (index + 1).toString() + verse;
    print(verse);
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      child: Text(' ${verse}',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25)),
    );
  }
}
