import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:namo_demo/stories/story_model.dart';
import 'package:namo_demo/utils/colors.dart';
import 'package:namo_demo/utils/images.dart';
import 'package:namo_demo/utils/string.dart';
import 'package:namo_demo/utils/widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:story/story_image.dart';
import 'package:story/story_page_view.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

final sampleUsers = [
  UserModel([
    StoryModel(
        "https://images.unsplash.com/photo-1601758228041-f3b2795255f1?ixid=MXwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxN3x8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    StoryModel(
        "https://images.unsplash.com/photo-1609418426663-8b5c127691f9?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNXx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    StoryModel(
        "https://images.unsplash.com/photo-1609444074870-2860a9a613e3?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1Nnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    StoryModel(
        "https://images.unsplash.com/photo-1609504373567-acda19c93dc4?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1MHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  ], "User1",
      "https://images.unsplash.com/photo-1609262772830-0decc49ec18c?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMDF8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  UserModel([
    StoryModel(
        "https://images.unsplash.com/photo-1609439547168-c973842210e1?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4Nnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  ], "User2",
      "https://images.unsplash.com/photo-1601758125946-6ec2ef64daf8?ixid=MXwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwzMjN8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  UserModel([
    StoryModel(
        "https://images.unsplash.com/photo-1609421139394-8def18a165df?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDl8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    StoryModel(
        "https://images.unsplash.com/photo-1609377375732-7abb74e435d9?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxODJ8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    StoryModel(
        "https://images.unsplash.com/photo-1560925978-3169a42619b2?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMjF8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  ], "User3",
      "https://images.unsplash.com/photo-1609127102567-8a9a21dc27d8?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzOTh8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
];

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
                                  onTap: (() {}),
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
                                      _showLanguageDialog(context);
                                    }),
                                    child: Image.asset(
                                        color: colorWhite,
                                        icLanguage,
                                        height: 20,
                                        width: 20)),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                  onTap: (() {}),
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
                            Text('STORIES', style: bodyText1(colorApp, ff: 1)),
                            SizedBox(height: 10),
                            Row(
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
                                SizedBox(width: 20),
                                InkWell(
                                    onTap: (() {
                                      Get.toNamed('/story');
                                    }),
                                    child: Image.asset(
                                        color: colorBlackDark,
                                        icRound,
                                        height: 50,
                                        width: 50)),
                                SizedBox(width: 20),
                                InkWell(
                                    onTap: (() {
                                      Get.toNamed('/story');
                                    }),
                                    child: Image.asset(
                                        color: colorBlackDark,
                                        icRound,
                                        height: 50,
                                        width: 50)),
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

void _showLanguageDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Select Language', style: blackTitle()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('English',
                  style: TextStyle(fontSize: 14.0, color: colorBlackDark)),
              onTap: () {
                // Implement language change logic
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('Gujarati',
                  style: TextStyle(fontSize: 14.0, color: colorBlackDark)),
              onTap: () {
                // Implement language change logic
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('Hindi',
                  style: TextStyle(fontSize: 14.0, color: colorBlackDark)),
              onTap: () {
                // Implement language change logic
                Navigator.of(context).pop();
              },
            ),
            // Add more languages as needed
          ],
        ),
      );
    },
  );
}
