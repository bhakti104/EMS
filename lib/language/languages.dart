import 'package:flutter/material.dart';

abstract class Languages {

  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get appName;

  String get labelWelcome;

  String get labelSelectLanguage;

  String get labelStories;
  String get labelHome;
  String get labelDashboard;
  String get labelReport;
  String get labelSetting;

}
