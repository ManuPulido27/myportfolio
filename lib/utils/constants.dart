import 'package:flutter/material.dart';

const Color kPrimaryColor = Colors.blue;
const Color kBackgroundColor = Colors.white70;
const Color kDangerColor = Colors.teal;
const Color kCaptionColor = Colors.black;

// Lets replace all static sizes
const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;
