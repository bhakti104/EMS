import 'dart:io' show File, FileMode, Platform;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:namo_demo/stories/story_data.dart';
import 'package:namo_demo/stories/story_model.dart';
import 'package:namo_demo/stories/user.dart';
import 'package:namo_demo/stories/users_data.dart';
import 'package:namo_demo/utils/widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:story_view/story_view.dart';
import 'package:namo_demo/stories/story_list_page.dart';
import 'package:namo_demo/stories/profile_widget.dart';

import '../utils/colors.dart';
import '../utils/images.dart';

class StoryWidget extends StatefulWidget {
  final User user;
  final PageController controller;

  const StoryWidget({
    required this.user,
    required this.controller,
  });

  @override
  _StoryWidgetState createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget>
    with SingleTickerProviderStateMixin {
  final storyItems = <StoryItem>[];
  late StoryController controller;
  String date = '';

  //like button
  int _likeCount = 0;
  int _shareCount = 0;
  late AnimationController animationControllerLike;
  late Animation<double> _scaleAnimationLike;




  void addStoryItems() {
    for (final StoryModel in stories) {
      switch (StoryModel.mediaType) {
        case MediaType.image:
          storyItems.add(StoryItem.pageImage(
            url: StoryModel.url!,
            controller: controller,
            // caption: StoryModel.caption,
            duration: Duration(
              milliseconds: (StoryModel.duration * 1000).toInt(),
            ),
          ));
          break;
        case MediaType.text:
          storyItems.add(
            StoryItem.text(
              title: StoryModel.caption!,
              backgroundColor: StoryModel.color,
              duration: Duration(
                milliseconds: (StoryModel.duration * 1000).toInt(),
              ),
            ),
          );
          break;
      }
    }
  }

  @override
  void initState() {
    super.initState();

    controller = StoryController();
    addStoryItems();
    date = widget.user.stories[0].date;

    //like button effect
    animationControllerLike = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );


    _scaleAnimationLike = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(
        parent: animationControllerLike,
        curve: Curves.easeInOut,
      ),
    );


    //for download file to share image
    download(savePath);
  }

  @override
  void dispose() {
    controller.dispose();
    animationControllerLike.dispose();

    super.dispose();
  }

  void _increaseLike() async {
    // Start the scale down animation
    await animationControllerLike.forward();
    // Scale back up
    await animationControllerLike.reverse();
    setState(() {
      _likeCount++;
    });
  }


  void handleCompleted() {
    widget.controller.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );

    final currentIndex = users.indexOf(widget.user);
    final isLastPage = users.length - 1 == currentIndex;

    if (isLastPage) {
      Navigator.of(context).pop();
    }
  }

  //share image/video
  String savePath = '';
  double progress = 0;
  bool didDownloadFile = false;

  Future download(String url) async {
    if (url.isEmpty) return;

    var tempDir = await getTemporaryDirectory();
    String fileName = url.split('/').last;
    savePath = '${tempDir.path}/$fileName';

    try {
      var response = await Dio().get(
        url,
        onReceiveProgress: updateProgress,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      var file = File(savePath).openSync(mode: FileMode.write);
      file.writeFromSync(response.data);
      await file.close();
      print('file downloaded');
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateProgress(done, total) async {
    progress = done / total;

    if (progress >= 1) {
      //Get.toNamed('/pdf_viewer', arguments: savePath);
      setState(() {
        didDownloadFile = true;
      });
    } else {
      // progressString = 'Download progress: ' + (progress * 100).toStringAsFixed(0) + '% done.';
    }
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          Material(
            type: MaterialType.transparency,
            child: StoryView(
              storyItems: storyItems,
              controller: controller,
              onComplete: handleCompleted,
              onVerticalSwipeComplete: (direction) {
                if (direction == Direction.down) {
                  Navigator.pop(context);
                }
              },
              //date and time
              // onStoryShow: (storyItem) {
              //   final index = storyItems.indexOf(storyItem);
              //   if (index > 0) {
              //     setState(() {
              //       date = stories[index].date;
              //     });
              //   }
              // },
            ),
          ),
          ProfileWidget(
            user: widget.user,
            date: date,
          ),

              Positioned(
                bottom: 20,
                right: 20,
                child: Column(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: _increaseLike,
                          child: ScaleTransition(
                            scale: _scaleAnimationLike,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(icLike, height: 30, width: 30),
                            ),
                          ),
                        ),

                        // InkWell(
                        //     onTap: (() {
                        //       setState(() {
                        //         _likeCount++;
                        //       });
                        //     }),
                        //     child: Image.asset(icLike, height: 30, width: 30)),
                        Text(
                          _likeCount.toString(),
                          style: bodyText3(colorWhite, ff: 3),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        InkWell(
                            onTap: (() {
                              Share.shareXFiles([XFile(savePath)]);
                              // Get.toNamed('/share_gallery');
                            }),
                            child: Image.asset(
                                icShare,
                                height: 30,
                                width: 30)),

                        Text(
                          _shareCount.toString(),
                          style: bodyText3(colorWhite, ff: 3),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
          Positioned(
            bottom: 20,
            right: 80,

                  child: Text(
                      'This is example of image and video stories This is example of image and video stories This is example of image and video stories This is example of image and video stories',
                      style: bodyText3(colorWhite, ff: 3)),

              )

        ],
      );
}
