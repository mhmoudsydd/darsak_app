import 'package:darsak/constant.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TopTeacherStudentCont extends StatelessWidget {
  const TopTeacherStudentCont({
    super.key,
    required this.studCont,
  });

  final String studCont;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: studCont,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: Constant.kMarFontFamily,
                color: AppColors.darkText,
              ),
            ),
            TextSpan(
              text: ' طالب',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: Constant.kMarFontFamily,
                color: AppColors.greyText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}