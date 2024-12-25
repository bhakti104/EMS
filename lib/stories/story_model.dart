import 'package:flutter/material.dart';

enum MediaType { image, text }

class StoryModel {
  final MediaType mediaType;
  final String? url;
  final double duration;
  String? caption;
  final String date;
  final Color color;

  StoryModel({
    required this.mediaType,
    this.caption,
    required this.date,
    this.url,
    this.duration = 5.0,
    this.color = Colors.grey,
  });
}
