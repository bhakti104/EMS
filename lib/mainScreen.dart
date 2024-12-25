import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:namo_demo/bottom_menu.dart';
import 'package:namo_demo/fragment/dashboard_fragment.dart';
import 'package:namo_demo/fragment/home_fragment.dart';
import 'package:namo_demo/fragment/report_fragment.dart';
import 'package:namo_demo/fragment/search_fragment.dart';
import 'package:namo_demo/fragment/setting_fragment.dart';
import 'package:namo_demo/language/languages.dart';
import 'package:namo_demo/stories/story_model.dart';
import 'package:namo_demo/theming/theme_manager.dart';
import 'package:namo_demo/utils/colors.dart';
import 'package:namo_demo/utils/images.dart';
import 'package:namo_demo/utils/widget.dart';
import 'package:provider/provider.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: Mainscreen(),
    ),
  );
}

class _MainscreenState extends State<Mainscreen>
    with SingleTickerProviderStateMixin {
  var _bottomNavIndex = 0;

  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  late int initialStoryIndex;
  // late List<StoryModel> stories;

  List<BottomMenu> menuList = <BottomMenu>[];

  double _iconHeight = 25;
  double _iconWidth = 25;

  TextStyle defaultStyle =
      const TextStyle(color: colorOffWhiteOneGray, fontSize: 10);

  TextStyle selectedStyle = const TextStyle(color: colorBlack, fontSize: 11);

  getBody() {
    switch (_bottomNavIndex) {
      case 0:
        return const HomeFragment();
        break;
      case 1:
        return const DashboardFragment();
        break;
      case 2:
        return const ReportFragment();
        break;
      case 3:
        return const SettingFragment();
        break;
    }
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      menuList.add(BottomMenu(icHome, 'Home'));
      // menuList.add(BottomMenu(icHome, Languages.of(context)!.labelHome,));
      menuList.add(BottomMenu(icDashboard, 'Dashboard'));
      menuList.add(BottomMenu(icReport, 'Report'));
      menuList.add(BottomMenu(icSetting, 'Setting'));
    });

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      const Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return Material(
            child: Scaffold(
              extendBody: true,
              body: WillPopScope(child: getBody(), onWillPop: onWillPop),
              // body: _body(),
              floatingActionButton: Visibility(
                visible: !keyboardIsOpen,
                child: ScaleTransition(
                  scale: animation,
                  child: FloatingActionButton(
                    elevation: 10,
                    backgroundColor: colorBlue,
                    child: Image.asset(
                      icSearch,
                      color: colorBlack,
                      height: 30,
                      width: 30,
                    ),
                    onPressed: () {
                      Get.toNamed('/search_fragment');
                    },
                  ),
                ),
              ),

              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,

              bottomNavigationBar: AnimatedBottomNavigationBar.builder(
                // backgroundColor: Colors.redAccent,
                itemCount: menuList.length,
                tabBuilder: (int index, bool isActive) {
                  const TextStyle(
                    fontSize: 14,
                    fontFamily: "SemiBold",
                    color: colorWhite,
                  );

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        menuList[index].icon,
                        color: _bottomNavIndex == index
                            ? colorBlack
                            : colorOffWhiteOneGray,
                        height: _iconHeight,
                        width: _iconWidth,
                      ),
                      Text(
                        menuList[index].title,
                        style: _bottomNavIndex == index
                            ? selectedStyle
                            : defaultStyle,
                      ),
                    ],
                  );
                },
                backgroundColor: colorBlue,
                //theme.isDarkTheme() ? colorBGDark2 : colorBGLight2,
                activeIndex: _bottomNavIndex,
                splashColor: colorBG,
                //theme.isDarkTheme() ? colorWhiteDark : colorBlackLight,
                // notchAndCornersAnimation: animation,
                splashSpeedInMilliseconds: 200,
                notchSmoothness: NotchSmoothness.softEdge,
                gapLocation: GapLocation.center,
                leftCornerRadius: 0,
                rightCornerRadius: 0,
                onTap: (index) => setState(() => _bottomNavIndex = index),
              ),
            ),
          );
        },
      ),
    );

    final themeNotifier = Provider.of<ThemeNotifier>(context);
  }

  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      toastMassage('Tap again to exit');
      return Future.value(false);
    }
    return Future.value(true);
  }
}
