import 'package:darsak/constant.dart';
import 'package:darsak/core/extension/num_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TeacherAvatar extends StatelessWidget {
  const TeacherAvatar({super.key, required this.color, required this.name});

  final Color color;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            shape: BoxShape.circle,
            border: Border.all(color: color.withValues(alpha: 0.4), width: 2),
          ),
          child: Center(
            child: Text(
              name.substring(3, 4),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: Constant.kMarFontFamily,
                color: color,
              ),
            ),
          ),
        ),
        8.sbh,
        Text(
          name,
          style: TextStyle(
            fontSize: 13,
            fontFamily: Constant.kFontFamily,
            fontWeight: FontWeight.w500,
            color: AppColors.darkText,
          ),
        ),
      ],
    );
  }
}