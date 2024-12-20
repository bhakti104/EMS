import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:namo_demo/utils/colors.dart';
import 'package:namo_demo/utils/colors.dart';
import 'package:namo_demo/utils/images.dart';

Widget verticalView() {
  return const SizedBox(
    height: 10,
  );
}

Widget verticalViewBig() {
  return const SizedBox(
    height: 15,
  );
}

TextStyle textExtraBoldBlack() {
  return const TextStyle(
      fontSize: 32,
      color: colorBlack,
      // fontFamily: "Bold",
      decoration: TextDecoration.none);
}

TextStyle textMediumWhite() {
  return const TextStyle(
      fontSize: 18,
      color: colorWhite,
      fontFamily: "Medium",
      decoration: TextDecoration.none);
}

TextStyle textSemiBoldBlackColor() {
  return const TextStyle(
      fontSize: 14,
      color: colorBlack,
      fontFamily: "SemiBold",
      decoration: TextDecoration.none);
}

TextStyle textRegularBlackColor() {
  return const TextStyle(
      fontSize: 14,
      color: colorBlack,
      fontFamily: "Regular",
      decoration: TextDecoration.none);
}

Widget btnBlue(BuildContext context, String label) {
  return Container(
    decoration: const BoxDecoration(
        color: colorBlue,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        )),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: 16,
                color: colorWhite,
                fontFamily: "Medium",
                decoration: TextDecoration.none),
          ),
        ],
      ),
    ),
  );
}

Widget btnGreen(BuildContext context, String label) {
  return Container(
    decoration: const BoxDecoration(
        color: colorGreenLight,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        )),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: 16,
                color: colorWhite,
                fontFamily: "Medium",
                decoration: TextDecoration.none),
          ),
        ],
      ),
    ),
  );
}

Widget btn(BuildContext context, String label) {
  return Container(
    decoration: BoxDecoration(
      color: colorWhite,
      border: Border.all(color: colorBlue, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: 16,
                color: colorBlack,
                fontFamily: "Medium",
                decoration: TextDecoration.none),
          ),
        ],
      ),
    ),
  );
}

Widget hDivider() {
  return const Divider(height: 0.7, thickness: 0.7, color: colorLightGray);
}

Widget vDivider() {
  return const VerticalDivider(color: colorLightGray, thickness: 0.5);
}

Widget textField(BuildContext context, TextEditingController controller,
    String hint, bool isPassword) {
  return Container(
    decoration: const BoxDecoration(
        color: colorLightGrayBG,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        )),
    child: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              obscureText: isPassword,
              textAlign: TextAlign.left,
              controller: controller,
              autofocus: false,
              onChanged: (text) {},
              style: textRegularBlackColor(),
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: hint),
            ),
          ),
        ],
      ),
    ),
  );
}

AppBar actionBar(bool isBack, String title) {
  return AppBar(
    title: Center(
      child: Row(
        children: [
          Visibility(
              visible: isBack,
              child: InkWell(
                  onTap: (() {
                    Get.back();
                  }),
                  child: Image.asset(
                      color: colorWhite, icBack, height: 25, width: 25))),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: whiteTitle(),
              ),
            ),
          ),
        ],
      ),
    ),
    backgroundColor: colorApp,
    automaticallyImplyLeading: false,
  );
}

TextStyle whiteTitle() {
  return const TextStyle(fontSize: 16.0, color: colorWhite);
}TextStyle blackTitle() {
  return const TextStyle(fontSize: 18.0,
     color: colorBlackDark);
}
Widget text(BuildContext context, String hint, TextEditingController controller,
    bool image) {
  return Container(
    height: 50,
    decoration: const BoxDecoration(
        color: colorLightGrayBG,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        )),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textAlign: TextAlign.left,
              controller: controller,
              autofocus: false,
              onChanged: (text) {},
              style: textRegularBlackColor(),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: const TextStyle(
                    fontSize: 14, fontFamily: "Regular", color: colorLightGray),
              ),
            ),
          ),
          Visibility(
            visible: image,
            child: Image.asset(
              "icArrowRight",
              height: 15,
              width: 15,
            ),
          ),
        ],
      ),
    ),
  );
}

void toastMassage(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 12.0);
}


TextStyle displayTitle1(Color color, {int? ff}) {
  return TextStyle(fontSize: 20, fontFamily: fontFamilyName(ff ?? 1), color: color);
}

TextStyle displayTitle2(Color color, {int? ff}) {
  return TextStyle(fontSize: 28, fontFamily: fontFamilyName(ff ?? 1), color: color);
}

TextStyle heading1(Color color, {int? ff}) {
  return TextStyle(fontSize: 18, fontFamily: fontFamilyName(ff ?? 1), color: color);
}

TextStyle heading2(Color color, {int? ff}) {
  return TextStyle(fontSize: 16, fontFamily: fontFamilyName(ff ?? 1), color: color);
}

TextStyle bodyText1(Color color, {int? ff}) {
  return TextStyle(fontSize: 14, fontFamily: fontFamilyName(ff ?? 1), color: color);
}

TextStyle bodyText2(Color color, {int? ff}) {
  return TextStyle(fontSize: 12, fontFamily: fontFamilyName(ff ?? 1), color: color);
}

TextStyle bodyText3(Color color, {int? ff}) {
  return TextStyle(fontSize: 10, fontFamily: fontFamilyName(ff ?? 1), color: color);
}

String fontFamilyName(int ff) {
  if (ff == 1) {
    return 'Regular';
  } else if (ff == 2) {
    return 'Medium';
  } else if (ff == 3) {
    return 'SemiBold';
  } else if (ff == 4) {
    return 'Bold';
  } else {
    return 'Regular';
  }
}