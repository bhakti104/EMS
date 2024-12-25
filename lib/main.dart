import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:namo_demo/auth/loginScreen.dart';
import 'package:namo_demo/auth/signUpScreen.dart';
import 'package:namo_demo/auth/splashScreen.dart';
import 'package:namo_demo/custom_drawer/drawerLeft.dart';
import 'package:namo_demo/language/locale_constant.dart';
import 'package:namo_demo/language/localizations_delegate.dart';
import 'package:namo_demo/routes/router.dart' as RouterFile;
import 'package:namo_demo/utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //Change Language
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Change Language
  Locale? _locale;
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //Change Language
      locale: _locale,
      title: 'Election Management System',
      home: LoginScreen(),
      //Change Language
      supportedLocales: [Locale('en', ''), Locale('gu', ''), Locale('hi', '')],
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      builder: EasyLoading.init(),
      getPages: RouterFile.Router.route,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: colorPrimary,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        )),
        primaryColor: colorBlack,
        brightness: Brightness.light,
        scaffoldBackgroundColor: colorWhite,
        dialogBackgroundColor: colorBlack,
        dividerColor: Colors.black12,
        cardColor: colorWhite,
        canvasColor: colorWhite,
        hintColor: colorGray,
        // accentColor: colorApp,
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.white),
        fontFamily: "Regular",
        // textTheme: const TextTheme(
        //   headline1: TextStyle(fontSize: 16, fontFamily: "Medium", color: colorText),
        //   headline2: TextStyle(fontSize: 26, fontFamily: "Medium", color: colorApp),
        //   headline3: TextStyle(fontSize: 20, fontFamily: "Medium", color: colorText),
        //   headline4: TextStyle(fontSize: 30, fontFamily: "Medium", color: colorWhite),
        //   bodyText1: TextStyle(
        //     fontSize: 14,
        //     fontFamily: "Medium",
        //     color: colorApp,
        //   ),
        //   bodyText2: TextStyle(
        //     fontSize: 16,
        //     fontFamily: "Medium",
        //     color: colorText,
        //   ),
        //   subtitle1: TextStyle(fontSize: 14, fontFamily: "Medium", color: colorApp),
        //   subtitle2: TextStyle(fontSize: 12, fontFamily: "Regular", color: colorText),
        //   button: TextStyle(fontSize: 16, fontFamily: "Medium", color: colorWhite),
        //   overline: TextStyle(fontSize: 10, fontFamily: "Regular"),
        // ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
            .copyWith(secondary: colorWhite),
      ),
    );
  }
}
