import 'package:darsak/constant.dart';
import 'package:darsak/core/extension/context_extension.dart';
import 'package:darsak/core/utils/reused_methods.dart';
import 'package:flutter/material.dart';

class TopTeacherNullImage extends StatelessWidget {
  const TopTeacherNullImage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.pw(0.3),
      height: 120,
      decoration: BoxDecoration(
        color: ReusedMethods.randomColors(),
        shape: BoxShape.rectangle,
      ),
      child: Center(
        child: Text(
          'أ.${name.substring(0, 1)}',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: Constant.kMarFontFamily,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}