import 'package:flutter/material.dart';

class Education {
  final String displayLink;
  final String description;
  final String linkName;
  final String period;
  final String photo;
  final String title;

  Education(
      {required this.description,
      required this.linkName,
      required this.period,
      required this.photo,
      required this.title,
      required this.displayLink});
}
