
import 'package:flutter/material.dart';
import 'package:namo_demo/stories/story_widget.dart';
import 'package:namo_demo/stories/user.dart';
import 'package:namo_demo/stories/users_data.dart';

class StoryPage extends StatefulWidget {
  final User user;

  const StoryPage({
    Key? key, required this.user,
  }) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  late PageController controller;

  @override
  void initState() {
    super.initState();

    final initialPage = users.indexOf(widget.user);
    controller = PageController(initialPage: initialPage);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PageView(
    controller: controller,
    children: users
        .map((user) => StoryWidget(
      user: user,
      controller: controller,
    ))
        .toList(),
  );
}
