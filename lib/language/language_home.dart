import 'package:flutter/material.dart';
import 'package:namo_demo/language/language_data_model.dart';
import 'package:namo_demo/language/languages.dart';
import 'package:namo_demo/language/locale_constant.dart';


class LanguageHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LanguageHomeState();
}

class LanguageHomeState extends State<LanguageHome> {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.language,
            color: Colors.white,
          ),
          title: Text(Languages
              .of(context)!
              .appName),
        ),
        body: Container(
          margin: EdgeInsets.all(30),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                Text(
                  Languages
                      .of(context)!
                      .labelWelcome,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 30,
                ),
                // Text(
                //   Languages
                //       .of(context)!
                //       .labelInfo,
                //   style: TextStyle(fontSize: 20, color: Colors.grey),
                //   textAlign: TextAlign.center,
                //
                // ),
                SizedBox(
                  height: 70,
                ),
                _createLanguageDropDown()
              ],
            ),
          ),
        ),
      );

  _createLanguageDropDown() {
    return DropdownButton<LanguageData>(
      iconSize: 30,
      hint: Text(Languages
          .of(context)!
          .labelSelectLanguage),
      onChanged: (LanguageData? language) {
        changeLanguage(context, language!.languageCode);
      },
      items: LanguageData.languageList()
          .map<DropdownMenuItem<LanguageData>>(
            (e) =>
            DropdownMenuItem<LanguageData>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    e.flag,
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(e.name)
                ],
              ),
            ),
      )
          .toList(),
    );
  }
}
