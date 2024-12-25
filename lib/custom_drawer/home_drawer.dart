import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namo_demo/menu_response.dart';
import 'package:namo_demo/utils/colors.dart';


import '../utils/images.dart';
import '../utils/preference.dart';
import '../utils/widget.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key, this.iconAnimationController, this.callBackIndex}) : super(key: key);

  final AnimationController? iconAnimationController;
  final Function(MenuData)? callBackIndex;

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  // List<DrawerList>? drawerList;

  // MainPresenter? _presenter;
  List<MenuData> dashboardList = [];
  var lastUpdate = '';
  // LoginResponse? userData;
  var clientLogo = '';
  var firstName = '';

  // _HomeDrawerState() {
  //   _presenter = MainPresenter(this);
  // }

  @override
  void initState() {
    super.initState();
    // userData = LoginResponse.fromJson(jsonDecode(PreferenceData.getUserInfo()));

    // if(userData != null){
    //   if(userData!.value != null){
    //     clientLogo = userData!.value!.clientLogo!;
    //     firstName = userData!.value!.firstName!;
    //   }
    // }

    // _presenter!.getAllMenu();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return Scaffold(
      backgroundColor: colorOffWhite.withOpacity(0.5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  AnimatedBuilder(
                    animation: widget.iconAnimationController!,
                    builder: (BuildContext context, Widget? child) {
                      return ScaleTransition(
                        scale: AlwaysStoppedAnimation<double>(1.0 - (widget.iconAnimationController!.value) * 0.2),
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation<double>(Tween<double>(begin: 0.0, end: 24.0)
                                  .animate(CurvedAnimation(parent: widget.iconAnimationController!, curve: Curves.fastOutSlowIn))
                                  .value /
                              360),
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: <BoxShadow>[
                                BoxShadow(color: colorGray.withOpacity(0.6), offset: const Offset(2.0, 4.0), blurRadius: 8),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(60.0)),
                              child: FadeInImage.assetNetwork(
                                placeholder: appLogo,
                                image: clientLogo ?? '',
                                fit: BoxFit.cover,
                                imageErrorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    appLogo,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 4),
                    child: Text(
                      'Bhakti Mehta',
                      // firstName ?? '',
                      style: heading2(colorGray,ff: 2)
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Divider(
            height: 1,
            color: colorGray.withOpacity(0.6),
          ),

          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [

                Row(
                  children: [
                    Text(
                      'Name',
                      style: textRegularBlackColor(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Bhakti',
                      style: textRegularBlackColor(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Mobile no',
                      style: textRegularBlackColor(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '123456789',
                      style: textRegularBlackColor(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Designation',
                      style: textRegularBlackColor(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Collector',
                      style: textRegularBlackColor(),
                    ),

                  ],
                ),             const SizedBox(
                  height: 5,
                ),


              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(0.0),
              itemCount: dashboardList?.length,
              itemBuilder: (BuildContext context, int index) {
                return inkwell(dashboardList[index]);
              },
            ),
          ),
          Divider(
            height: 1,
            color: colorGray.withOpacity(0.6),
          ),
          Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Sign Out',
                  style: heading2(colorText),
                ),
                trailing: const Icon(
                  Icons.power_settings_new,
                  color: colorRed,
                ),
                onTap: () {
                  logoutDialog(context, 'Are you sure you want to logout?');
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
          ),
        ],
      ),
    );
  }


  logoutDialog(BuildContext context, String message) {
    showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: colorOffWhite,
            title: const Text("Logout", style: TextStyle(fontSize: 18, color: colorBlack, fontFamily: "Medium")),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(message, style: heading2(colorBlack)),
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
                  PreferenceData.clearData();
                  Get.offAllNamed('/login');
                },
              )
            ],
          );
        });
  }


  Widget inkwell(MenuData listData) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: () {
          //todo
          //menu.isSelected = true;
          for (int i = 0; i < dashboardList.length; i++) {
            dashboardList[i].isSelected = false;
          }
          listData.isSelected = true;

          navigationtoScreen(listData);
        },
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 6.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: listData.isSelected
                          ? Colors.blue
                          : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  // listData.isAssetsImage
                  //     ? Container(
                  //         width: 24,
                  //         height: 24,
                  //         child: Image.asset(listData.imageName, color: widget.screenIndex == listData.index ? colorApp : colorSecondary),
                  //       )
                  //     : Icon(listData.icon?.icon, color: widget.screenIndex == listData.index ? colorApp : colorSecondary),
                  Image.network(
                    listData.iconUrl!,
                    height: 24,
                    width: 24,
                    // color: listData.isSelected ? colorApp : colorSecondary,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: colorWhite,
                        height: 24,
                        width: 24,
                      );
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  Text(
                    listData.menuDisplayName!,
                    style: bodyText1(listData.isSelected ? colorBlack : colorSecondary,ff: 2),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            listData.isSelected
                ? AnimatedBuilder(
                    animation: widget.iconAnimationController!,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        transform: Matrix4.translationValues(
                            (MediaQuery.of(context).size.width * 0.75 - 64) * (1.0 - widget.iconAnimationController!.value - 1.0), 0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.75 - 64,
                            height: 46,
                            // decoration: BoxDecoration(
                            //   color: colorApp.withOpacity(0.2),
                            //   borderRadius: const BorderRadius.only(
                            //     topLeft: Radius.circular(0),
                            //     topRight: Radius.circular(28),
                            //     bottomLeft: Radius.circular(0),
                            //     bottomRight: Radius.circular(28),
                            //   ),
                            // ),
                          ),
                        ),
                      );
                    },
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Future<void> navigationtoScreen(MenuData indexScreen) async {
    widget.callBackIndex!(indexScreen);
  }

  @override
  void onError(int errorCode) {
    // CheckResponseCode.getResponseCode(errorCode, context);
  }

  @override
  void onMenuListSuccess(MenuResponse data) {
    if (data.success!) {
      dashboardList = [];
      dashboardList.addAll(data.value!);

      // sTitle = sApplicationName;
      lastUpdate = data.lastUpload!;

      setState(() {});
    } else {
      if (data.resultMessage! != null) {
        // toastMassage(data.resultMessage!);
      }
    }
  }

  @override
  void onDrawerMenuListSuccess(MenuResponse data) {
    // TODO: implement onDrawerMenuListSuccess
  }
}

