import 'package:darsak/constant.dart';
import 'package:darsak/core/extension/num_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.ontap,
    required this.title,
    this.showAllIsShow = true,
  });

  final VoidCallback ontap;
  final String title;
  final bool showAllIsShow;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: Constant.kMarFontFamily,
            color: AppColors.darkText,
          ),
        ),
        showAllIsShow
            ? TextButton(
                onPressed: ontap,
                child: Text(
                  'عرض الكل',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: Constant.kFontFamily,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
              )
            : 0.sbh,
      ],
    );
  }
}
