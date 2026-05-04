import 'package:darsak/constant.dart';
import 'package:darsak/core/extension/num_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TopTeacherRate extends StatelessWidget {
  const TopTeacherRate({
    super.key,
    required this.rate,
    required this.rateCont,
  });

  final String rate;
  final String rateCont;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.bottomStart,
      child: Row(
        children: [
          const Icon(
            Icons.star_rounded,
            color: Colors.amber,
            size: 20,
          ),
          4.sbw,
          Text(
            rate,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: Constant.kMarFontFamily,
              color: AppColors.darkText,
            ),
          ),
          4.sbw,
          Text(
            '($rateCont تقييم)',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: Constant.kMarFontFamily,
              color: AppColors.greyText,
            ),
          ),
        ],
      ),
    );
  }
}