import 'package:darsak/constant.dart';
import 'package:flutter/material.dart';

class SubscribeTeacherNullImage extends StatelessWidget {
  const SubscribeTeacherNullImage({
    super.key,
    required this.name,
    required this.color,
  });

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          name.substring(3, 4),
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: Constant.kMarFontFamily,
            color: color,
          ),
        ),
      );
  }
}