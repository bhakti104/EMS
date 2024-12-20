
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:namo_demo/utils/colors.dart';
import 'package:namo_demo/utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

_openNextScreen() {
  // _infoPresenter = UserInfoPresenter(this);

  WidgetsFlutterBinding.ensureInitialized();
  // Timer( const Duration(seconds: 2), () {
  //   //   if (PreferenceData.getToken().isNotEmpty) {
  //   //     Get.offNamed('/main_screen');
  //   // } else {
  //   Get.offNamed('/login');
  Get.toNamed('/login');

  //   // }
  // });
}

void initState() {
  initState();
  // PreferenceData.getInstance();
  _openNextScreen();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: colorApp,
        body: Center(
          child: Image.asset(appLogo, height: 350, width: 300),
        ),
      ),
    );
  }
}
