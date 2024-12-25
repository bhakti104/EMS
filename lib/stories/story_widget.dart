import 'package:flutter/material.dart';
import 'package:namo_demo/stories/story_data.dart';
import 'package:namo_demo/stories/story_model.dart';
import 'package:namo_demo/stories/user.dart';
import 'package:namo_demo/stories/users_data.dart';
import 'package:story_view/story_view.dart';
import 'package:namo_demo/stories/story_list_page.dart';
import 'package:namo_demo/stories/profile_widget.dart';


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

class _StoryWidgetState extends State<StoryWidget> {
  final storyItems = <StoryItem>[];
  late StoryController controller;
  String date = '';

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
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
        ],
      );
}
