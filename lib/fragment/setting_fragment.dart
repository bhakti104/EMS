import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:namo_demo/utils/colors.dart';
import 'package:namo_demo/utils/images.dart';
import 'package:namo_demo/utils/widget.dart';

class SettingFragment extends StatefulWidget {
  const SettingFragment({super.key});

  @override
  State<SettingFragment> createState() => _SettingFragmentState();
}

class _SettingFragmentState extends State<SettingFragment> {
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
                                    'Setting',
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
                      Center(
                        child: Container(
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: colorGray),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Text(
                                  'Personal Details',
                                  style: textExtraBoldBlack(),
                                ),
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
                                Row(
                                  children: [
                                    Text(
                                      'Address',
                                      style: textRegularBlackColor(),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Bardoli',
                                      style: textRegularBlackColor(),
                                    ),

                                  ],
                                ),          const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Last Access',
                                      style: textRegularBlackColor(),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '04/12/2023',
                                      style: textRegularBlackColor(),
                                    ),

                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
