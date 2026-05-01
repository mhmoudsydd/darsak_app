import 'package:darsak/constant.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SubTitleMaterialChip extends StatelessWidget {
  const SubTitleMaterialChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          const Icon(
            Icons.auto_awesome_rounded,
            color: AppColors.primaryColor,
            size: 18,
          ),
          const SizedBox(width: 6),
          Text(
            'اختر المادة التي تريد الاشتراك فيها',
            style: TextStyle(
              fontFamily: Constant.kFontFamily,
              fontSize: 14,
              color: AppColors.greyText,
            ),
          ),
        ],
      ),
    );
  }
}