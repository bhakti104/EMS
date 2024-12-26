import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:namo_demo/custom_drawer/drawer_user_controller.dart';
import 'package:namo_demo/language/language_data_model.dart';
import 'package:namo_demo/language/languages.dart';
import 'package:namo_demo/language/locale_constant.dart';
import 'package:namo_demo/mainScreen.dart';
import 'package:namo_demo/menu_response.dart';
import 'package:namo_demo/stories/story_model.dart';
import 'package:namo_demo/stories/users_data.dart';
import 'package:namo_demo/utils/colors.dart';
import 'package:namo_demo/utils/images.dart';
import 'package:namo_demo/utils/string.dart';
import 'package:namo_demo/utils/widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:story/story_image.dart';
import 'package:story/story_page_view.dart';
import 'package:flutter/material.dart';
import 'package:namo_demo/language/language_data_model.dart';
import 'package:namo_demo/language/languages.dart';
import 'package:namo_demo/language/locale_constant.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment>
    with SingleTickerProviderStateMixin {
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;

  int activeIndex = 0;
  final List<String> imgList = [
    imgOne,
    imgOne,
    imgOne,
    imgOne,
    imgOne,
    imgOne,
    imgOne,
    imgOne,
    imgOne,
    imgOne,
  ];

  @override
  void initState() {
    super.initState();
    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
        IndicatorAnimationCommand.resume);
  }

  @override
  void dispose() {
    indicatorAnimationController.dispose();
    super.dispose();
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
                                    Get.toNamed('/drawer_main');
                                  }),
                                  child: Image.asset(
                                      color: colorWhite,
                                      imgProfile,
                                      height: 20,
                                      width: 20)),
                              Expanded(child: Container()),
                              const SizedBox(
                                width: 10,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                    onTap: (() {

                                        setState(() {
                                          _showLanguageDialog(context);

                                        });

                                    }),
                                    child: Image.asset(
                                        color: colorWhite,
                                        icLanguage,
                                        height: 20,
                                        width: 20)),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                  onTap: (() {
                                  }),
                                  child: Image.asset(
                                      color: colorWhite,
                                      icNotification,
                                      height: 20,
                                      width: 20)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Languages.of(context)!.labelStories,
                                style: bodyText1(colorApp, ff: 1)),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: (() {
                                          Get.toNamed('/story');
                                          // Get.toNamed('/story', arguments: users);
                                        }),
                                        child: Image.asset(
                                            color: colorBlackDark,
                                            icRound,
                                            height: 50,
                                            width: 50)),
                                    Text('ImageOne',
                                        style: bodyText3(colorBlack, ff: 1)),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: (() {
                                          Get.toNamed('/story');
                                        }),
                                        child: Image.asset(
                                            color: colorBlackDark,
                                            icRound,
                                            height: 50,
                                            width: 50)),
                                    Text('ImageTwo',
                                        style: bodyText3(colorBlack, ff: 1)),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: (() {
                                          Get.toNamed('/story');
                                        }),
                                        child: Image.asset(
                                            color: colorBlackDark,
                                            icRound,
                                            height: 50,
                                            width: 50)),
                                    Text('ImageThree',
                                        style: bodyText3(colorBlack, ff: 1)),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            CarouselSlider(
                              items: imgList
                                  .map(
                                    (item) => Image.network(
                                      item,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  )
                                  .toList(),
                              options: CarouselOptions(
                                height: 300,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    activeIndex = index;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 16),
                            AnimatedSmoothIndicator(
                              activeIndex: activeIndex,
                              count: imgList.length,
                              effect: const ExpandingDotsEffect(
                                dotHeight: 8,
                                dotWidth: 8,
                                activeDotColor: Colors.blue,
                                dotColor: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ])))));
  }
}


void _showLanguageDialog(context) {
  showDialog(
    context: context,
    builder: (BuildContext context,) {
      return AlertDialog(
        title: Text('Select Language', style: blackTitle()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('English',
                  style: TextStyle(fontSize: 14.0, color: colorBlackDark)),
              onTap: () {
                // setState(() {
                  changeLanguage(context, 'en');
                  Get.back();
                // });

              },
            ),
            ListTile(
              title: const Text('Gujarati',
                  style: TextStyle(fontSize: 14.0, color: colorBlackDark)),
              onTap: () {
                // Implement language change logic
                changeLanguage(context, 'gu');
                Get.back();
              },
            ),
            ListTile(
              title: const Text('Hindi',
                  style: TextStyle(fontSize: 14.0, color: colorBlackDark)),
              onTap: () {
                // Implement language change logic
                changeLanguage(context, 'hi');
                Get.back();
              },
            ),
            // Add more languages as needed
          ],
        ),
      );
    },
  );
}
