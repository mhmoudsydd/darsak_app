import 'package:darsak/constant.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  final double fontSize;
  final FontWeight fontWeight;
  const LogoText({super.key, required this.fontSize, required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      'دروسك',
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: Constant.kMarFontFamily,
        color: AppColors.primaryColor,
      ),
    );
  }
}
