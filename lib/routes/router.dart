import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:namo_demo/auth/loginScreen.dart';
import 'package:namo_demo/auth/signUpScreen.dart';
import 'package:namo_demo/auth/splashScreen.dart';
import 'package:namo_demo/fragment/search_fragment.dart';
import 'package:namo_demo/mainScreen.dart';
import 'package:namo_demo/stories/story.dart';


class Router {
  static final route = [
    GetPage(name: '/splash', page: () => const SplashScreen()),
    GetPage(name: '/login', page: () => const LoginScreen()),
    GetPage(name: '/signUp', page: () => const SignUpscreen()),
    GetPage(name: '/main_setting', page: () => const Mainscreen()),
    GetPage(name: '/search_fragment', page: () => const SearchFragment()),
    GetPage(name: '/story', page: () => const Story())
  ];
}
