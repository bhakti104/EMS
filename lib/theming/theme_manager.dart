
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:namo_demo/utils/colors.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: colorBGDark1,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: colorBGDark1,
    dialogBackgroundColor: colorBGDark2,
    // backgroundColor: Color(0xffA6DD63),
    hintColor: Colors.white,
    dividerColor: Colors.black12,
    cardColor: colorBGDark2,
    canvasColor: colorWhiteDark,
    // hintColor: colorTextWhiteDark,
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.black54),
    fontFamily: "Regular",
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 15,
          fontFamily: "SemiBold",
          color: colorWhiteDark,
          fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
          fontSize: 30,
          fontFamily: "SemiBold",
          color: colorWhiteDark,
          fontWeight: FontWeight.bold),
      displaySmall: TextStyle(
          fontSize: 25,
          fontFamily: "SemiBold",
          color: colorWhiteDark,
          fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(
          fontSize: 18,
          fontFamily: "SemiBold",
          color: colorWhiteDark,
          fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(
        fontSize: 14,
        fontFamily: "Regular",
        color: colorWhiteDark,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontFamily: "Regular",
        color: colorWhiteDark,
      ),
      titleMedium: TextStyle(
          fontSize: 12, fontFamily: "Regular", color: colorTextWhiteDark),
      titleSmall: TextStyle(
          fontSize: 11, fontFamily: "Regular", color: colorTextWhiteDark),
      labelLarge:
          TextStyle(fontSize: 18, fontFamily: "SemiBold", color: colorBGDark2),
      labelSmall: TextStyle(fontSize: 10, fontFamily: "Regular"),
    ),
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: colorBGLight1,
    brightness: Brightness.light,
    scaffoldBackgroundColor: colorBGLight1,
    dialogBackgroundColor: colorBGLight2,
    // backgroundColor: Color(0xffA6DD63),
    hintColor: Colors.black,
    // actionIconTheme: const IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    cardColor: colorBGLight2,
    canvasColor: colorPrimaryTextLight,
    // hintColor: Colors.black,
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Colors.black54),
    fontFamily: "Regular",
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 15,
          fontFamily: "SemiBold",
          color: colorBlackLight,
          fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
          fontSize: 30,
          fontFamily: "SemiBold",
          color: colorBlackLight,
          fontWeight: FontWeight.bold),
      displaySmall: TextStyle(
          fontSize: 25,
          fontFamily: "SemiBold",
          color: colorBlackLight,
          fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(
          fontSize: 18,
          fontFamily: "SemiBold",
          color: colorBlackLight,
          fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(
          fontSize: 20,
          fontFamily: "Regular",
          color: colorWhiteDark,
          fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(
        fontSize: 14,
        fontFamily: "Regular",
        color: colorBlackLight,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontFamily: "Regular",
        color: colorBlackLight,
      ),
      titleMedium: TextStyle(
          fontSize: 12, fontFamily: "Regular", color: colorTextWhiteLight),
      titleSmall: TextStyle(
          fontSize: 11, fontFamily: "Regular", color: colorTextWhiteLight),
      labelLarge:
          TextStyle(fontSize: 18, fontFamily: "SemiBold", color: colorBGDark2),
      labelSmall: TextStyle(fontSize: 10, fontFamily: "Regular"),
    ),
  );

  // ThemeData _themeData;

  // ThemeData getTheme() => _themeData;

  // ThemeNotifier() {
  //   StorageManager.readData('themeMode').then((value) {
  //     print('value read from storage: ' + value.toString());
  //     var themeMode = value ?? 'light';
  //     // if (themeMode == 'light') {
  //     //   _themeData = lightTheme;
  //     //   setSystemUiOverlayStyle(false);
  //     // } else {
  //     //   print('setting dark theme');
  //     //   _themeData = darkTheme;
  //     //   setSystemUiOverlayStyle(true);
  //     // }
  //     notifyListeners();
  //   });
  //
  // }

  // bool isDarkTheme() {
  //   if (_themeData == darkTheme) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  setSystemUiOverlayStyle(bool isDark) {
    if (isDark) {
      final systemTheme = SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: colorBGDark2,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: colorBGDark2,
        statusBarIconBrightness: Brightness.light,
      );

      SystemChrome.setSystemUIOverlayStyle(systemTheme);
    } else {
      final systemTheme = SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: colorWhiteDark,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: colorWhiteDark,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      );

      SystemChrome.setSystemUIOverlayStyle(systemTheme);
    }
  }

}
