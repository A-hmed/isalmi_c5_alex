import 'package:flutter/material.dart';
import 'package:isalmi_c5_alex/home/ahadeth/AhadethFragment.dart';

class HadehtDetails extends StatelessWidget {
  static String ROUTE_NAME = 'HadethDeatils';

  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/default_bg.png'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: Text(
            hadeth.title,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * .6,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, .8),
            borderRadius: BorderRadius.circular(18),
          ),
          child: SingleChildScrollView(
              child: Text(
            hadeth.content,
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 20),
          )),
        ),
      ),
    );
  }
}
