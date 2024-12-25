
import 'package:flutter/material.dart';
import 'package:namo_demo/stories/story_model.dart';
import 'package:namo_demo/stories/story_page.dart';
import 'package:namo_demo/stories/story_widget.dart';
import 'package:namo_demo/stories/user.dart';
import 'package:namo_demo/stories/users_data.dart';
import 'package:story_view/story_view.dart';
import '../main.dart';

// class StoryListPage extends StatefulWidget {
//   final User user;
//   const StoryListPage({
//     Key? key, required this.user,
//   }) : super(key: key);
//
//   @override
//   _StoryListPageState createState() => _StoryListPageState();
// }
//
// class _StoryListPageState extends State<StoryListPage> {
//   late PageController controller;
//
//   @override
//   void initState() {
//     super.initState();
//
//     final initialPage = users.indexOf(widget.user!);
//     controller = PageController(initialPage: initialPage);
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }


class StoryListPage extends StatelessWidget {
@override
Widget build(BuildContext context)=> Scaffold(
  body: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView(
      children: users
          .map((user) => ListTile(
        title:
        Text(
          user.name,
          // '',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: CircleAvatar(
            backgroundImage: AssetImage(user.imgUrl)),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => StoryPage(user: user),
            ),
          );
        },
      ))
          .toList(),
    ),
  ),
);

  // @override
  // Widget build(BuildContext context)=> PageView(
  //   controller: controller,
  //   children: users
  //       .map((user) => StoryWidget(
  //     user: user,
  //     controller: controller,
  //   ))
  //       .toList(),
  // );
}



