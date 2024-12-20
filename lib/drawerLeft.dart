import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:namo_demo/auth/loginScreen.dart';
import 'package:namo_demo/auth/signUpScreen.dart';
import 'package:namo_demo/custom_drawer/drawer_user_controller.dart';
import 'package:namo_demo/mainScreen.dart';
import 'package:namo_demo/menu_response.dart';
import 'package:namo_demo/utils/colors.dart';
import 'package:namo_demo/utils/images.dart';
import 'package:namo_demo/utils/widget.dart';

class DrawerLeft extends StatefulWidget {
  const DrawerLeft({super.key});

  @override
  State<DrawerLeft> createState() => _DrawerLeftState();
}

class _DrawerLeftState extends State<DrawerLeft> {
  Widget? screenView;

  @override
  void initState() {
    screenView = const LoginScreen();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(colorApp);

    return Container(
      color: colorWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: colorOffWhite,
          body: WillPopScope(
            onWillPop: onWillPop,
            child: DrawerUserController(
              drawerWidth: MediaQuery.of(context).size.width * 0.75,
              onDrawerCall: (MenuData? menu) {
                setState(() {
                  screenView = _getDrawerItemWidget(menu);
                });
              },
              screenView: screenView,
            ),
          ),
        ),
      ),
    );
  }

  _getDrawerItemWidget( menu) {
    switch (menu.menuId) {
      // case 1:
      //   return const Mainscreen();
      // case 15:
      //   return const Mainscreen ();
      // case 16:
      //   return const Gallery();
      // case 18:
      //   return const OrderList();
      // case 7:
      //   return const ContactMaster();
      // case 13:
      //   return const ChangePassword();
      // case 19:
      //   return const AccountMaster();
      // case 50:
      //   return const OrderEntryTrading();
    // case 48:
    //   return const IssueEntry();
    // case 14:
    //   return const Approval();
    // case 57:
    //   return const ReceiveEntry();
    // case 56:
    //   openScanner();
    //   return dashboard();

      // default:
      //   return SalePurchaseReport(key: Key(menu.menuName!), type: menu.menuName!);
    }
  }

  Future<bool> onWillPop() {


    if(screenView != const LoginScreen()){
      setState(() {
        screenView = const LoginScreen();
      });
      return Future.value(false);
    }else{
      exitDialog(context);
      return Future.value(false);
    }

  }
  exitDialog(BuildContext context) {
    showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: colorOffWhite,
            title:  Text("Exit App!", style: heading2(colorBlack,ff: 3)),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Are you sure you want to exit?', style: heading2(colorBlack,ff: 2)),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "NO",
                  style: bodyText1(colorApp, ff: 2),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  "YES",
                  style: bodyText1(colorApp, ff: 2),
                ),
                onPressed: () {
                  exit(0);
                },
              )
            ],
          );
        });
  }


}
