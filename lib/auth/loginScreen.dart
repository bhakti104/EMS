import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:namo_demo/auth/signUpScreen.dart';
import 'package:namo_demo/utils/colors.dart';
import 'package:namo_demo/utils/images.dart';
import 'package:namo_demo/utils/string.dart';
import 'package:namo_demo/utils/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void onClickSignIn() {
    Get.toNamed('/signUp');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: colorWhite,
          body: SingleChildScrollView(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalViewBig(),
                        Text(
                          welcome,
                          style: textExtraBoldBlack(),
                        ),
                        verticalViewBig(),
                        hDivider(),
                        verticalViewBig(),
                        Container(
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
                                    // obscureText: isPassword,
                                    textAlign: TextAlign.left,
                                    // controller: controller,
                                    autofocus: false,
                                    onChanged: (text) {},
                                    style: textRegularBlackColor(),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Enter mobile number"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        verticalViewBig(),
                        InkWell(
                            onTap: (() {
                              // onClickSignIn();
                            }),
                            child: btnBlue(context, logInWithOTP)),
                        verticalViewBig(),
                        const Row(children: [
                          Expanded(child: Divider(thickness: 1.5)),
                          Text("  OR  ",
                              style: TextStyle(
                                fontSize: 14,
                                color: colorBlack,
                                fontFamily: "SemiBold",
                              )),
                          Expanded(child: Divider(thickness: 1.5)),
                        ]),
                        verticalViewBig(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(imgFb, height: 50, width: 50),
                            vDivider(),
                            Image.asset(imgGmail, height: 50, width: 50),
                            vDivider(),
                            Image.asset(imgTwitter, height: 38, width: 38),
                            vDivider(),
                            Image.asset(imgApple, height: 50, width: 50)
                          ],
                        ),
                        verticalViewBig(),
                        const Row(children: [
                          Expanded(child: Divider(thickness: 1.5)),
                          Text("  OR  ",
                              style: TextStyle(
                                fontSize: 14,
                                color: colorBlack,
                                fontFamily: "SemiBold",
                              )),
                          Expanded(child: Divider(thickness: 1.5)),
                        ]),
                        verticalViewBig(),
                        Text(
                          email,
                          style: textSemiBoldBlackColor(),
                        ),
                        verticalView(),
                        textField(
                            context, userNameController, userNameHint, false),
                        verticalViewBig(),
                        Text(
                          password,
                          style: textSemiBoldBlackColor(),
                        ),
                        verticalView(),
                        textField(
                            context, passwordController, passwordHint, true),
                        verticalViewBig(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: (() {
                                Get.toNamed('/forgot');
                              }),
                              child: Text(
                                forgotPassword + ' ?',
                                style: textSemiBoldBlackColor(),
                              ),
                            ),
                          ],
                        ),
                        verticalViewBig(),
                        InkWell(
                            onTap: (() {
                              // onClickSignIn();
                            }),
                            child: btnGreen(context, signIn)),
                        verticalViewBig(),
                        const Row(children: [
                          Expanded(child: Divider(thickness: 1.5)),
                          Text("  OR  ",
                              style: TextStyle(
                                fontSize: 14,
                                color: colorBlack,
                                fontFamily: "SemiBold",
                              )),
                          Expanded(child: Divider(thickness: 1.5)),
                        ]),
                        verticalViewBig(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children:<Widget> [

                            Expanded(
                              child: InkWell(
                                  onTap: (() {
                                     onClickSignIn();
                                  }),
                                  child: btn(context, signUp)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: InkWell(
                                  onTap: (() {
                                    // onClickSignIn();
                                  }),
                                  child: btn(context, contiGuest)),
                            ),
                          ],
                        ),
                        verticalViewBig(),
                        verticalViewBig(),
                        Center(
                          child: Text(
                            loginPrivacyDec,
                            style: textSemiBoldBlackColor(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
