import 'package:flutter/material.dart';
import 'package:namo_demo/stories/user.dart';
import 'package:namo_demo/utils/colors.dart';
import 'package:namo_demo/utils/widget.dart';

class ProfileWidget extends StatelessWidget {
  final User user;
  final String date;

  const ProfileWidget({
    required this.user,
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Material(
        type: MaterialType.transparency,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 48),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(user.imgUrl),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //username
                    Text(
                        user.name,
                        style: heading2(colorWhite,)
                    ),
                    Text(
                      date,
                      style: heading2(colorWhite),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
