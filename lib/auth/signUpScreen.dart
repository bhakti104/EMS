import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:namo_demo/utils/colors.dart';
import 'package:namo_demo/utils/images.dart';
import 'package:namo_demo/utils/string.dart';
import 'package:namo_demo/utils/widget.dart';

class SignUpscreen extends StatefulWidget {
  const SignUpscreen({super.key});

  @override
  State<SignUpscreen> createState() => _SignUpscreenState();
}

class _SignUpscreenState extends State<SignUpscreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController conController = TextEditingController();
  TextEditingController inviController = TextEditingController();

  bool valuefirst = false;
  bool valuesecond = false;

  @override
  void initState() {
    super.initState();

    // cityController.text = data.city != null ? data.city! : '';
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            child: Scaffold(
                backgroundColor: colorWhite,
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: colorApp,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: (() {
                                    Get.back();
                                  }),
                                  child: Image.asset(
                                      color: colorWhite,
                                      icBack,
                                      height: 25,
                                      width: 25)),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "CREATE YOUR PROFILE",
                                    style: whiteTitle(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      verticalViewBig(),
                      Center(
                          child: Image.asset(imgProfile, height: 80, width: 80)),
                      verticalViewBig(),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name *',
                              style: textSemiBoldBlackColor(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            textField(context, nameController, hintName, false),
                            verticalViewBig(),
                            Text(
                              'Email ID *',
                              style: textSemiBoldBlackColor(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            textField(
                                context, emailController, hintEmail, false),
                            verticalViewBig(),
                            Text(
                              'Password *',
                              style: textSemiBoldBlackColor(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            textField(context, passController, hintPass, false),
                            verticalViewBig(),
                            Text(
                              'Confirm Password *',
                              style: textSemiBoldBlackColor(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            textField(
                                context, conController, hintConPass, false),
                            verticalViewBig(),
                            Text(
                              'Invitation Code',
                              style: textSemiBoldBlackColor(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            textField(context, inviController, hintInvi, false),
                            verticalViewBig(),
                            Row(children: [
                              Checkbox(
                                // checkColor: colorBlackDark,
                                // activeColor: colorWhite,
                                // tristate: true, // Example with tristate
                                value: valuefirst,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    valuefirst = newValue!;
                                  });
                                },
                              ),
                              const Text(
                                'I want to Volunteer',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: colorBlack,
                                  fontFamily: "SemiBold",
                                ),
                              ),
                            ]),
                            verticalViewBig(),
                            Row(
                                  children: [
                                    Checkbox(
                                        // checkColor: colorBlackDark,
                                        // activeColor: colorWhite,
                                        value: this.valuesecond,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.valuesecond = value!;
                                          });
                                        },

                                    ),
                                    Expanded(
                                      child: Text(
                                        'I agree to share my name, email, phone number, interests, demographic details, etc. with the Narendra Modi App & integrated third party services for processing, to understand my app usage and receive personalized communication from PM Modi. I understand this usage will be based on the Privacy Policy & Terms of Use.',
                                        style: textSemiBoldBlackColor(),
                                      ),
                                    ),
                                  ]),

                            verticalViewBig(),
                            InkWell(
                                onTap: (() {
                                  onClickSignIn();
                                }),
                                child: btnBlue(context, submit)),
                            verticalViewBig(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))));
  }

  void onClickSignIn() {
    Get.toNamed('/main_setting');

  }
}
