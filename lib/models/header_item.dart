import 'package:flutter/material.dart';

class HeaderItem {
  final String title;
  final VoidCallback onTap;
  final bool isButton;
  final int index;

  HeaderItem({
    required this.title,
    required this.onTap,
    this.isButton = false,
    required this.index,
  });
}
