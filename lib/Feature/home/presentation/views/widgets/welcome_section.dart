import 'package:darsak/constant.dart';
import 'package:darsak/core/extension/num_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            'أهلاً بك مجدداً! 👋',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: Constant.kMarFontFamily,
              color: AppColors.darkText,
            ),
          ),
          4.sbw,
          Text(
            'مستقبلك يبدأ هنا',
            style: TextStyle(
              fontSize: 16,
              fontFamily: Constant.kFontFamily,
              fontWeight: FontWeight.w500,
              color: AppColors.greyText,
            ),
          ),
        ],
      ),
    );
  }
}
