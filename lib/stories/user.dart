import 'package:flutter/cupertino.dart';
import 'package:namo_demo/stories/story_list_page.dart';
import 'package:namo_demo/stories/story_model.dart';

class User {
  final String name;
  final String imgUrl;
  final List<StoryModel> stories;

  const User({
    required this.name,
    required this.imgUrl,
    required this.stories,
  });
}
