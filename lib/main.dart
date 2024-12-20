import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:namo_demo/auth/loginScreen.dart';
import 'package:namo_demo/auth/signUpScreen.dart';
import 'package:namo_demo/auth/splashScreen.dart';
import 'package:namo_demo/drawerLeft.dart';
import 'package:namo_demo/routes/router.dart' as RouterFile;
import 'package:namo_demo/utils/colors.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Election Management System',
      home: LoginScreen(),
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
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
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
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(secondary: colorWhite),
      ),
    );
  }
}


