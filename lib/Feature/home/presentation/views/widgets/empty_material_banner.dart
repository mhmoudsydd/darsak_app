import 'package:darsak/constant.dart';
import 'package:darsak/core/extension/string_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:darsak/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class EmptyMaterialsBanner extends StatelessWidget {
  const EmptyMaterialsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FE), // Soft background
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryColor.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withValues(alpha: 0.08),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: SvgPicture.asset(
              'learning'.toSvg,
              width: 32,
              height: 32,
              colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'لم تشترك في أي مادة بعد!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: Constant.kMarFontFamily,
              color: AppColors.darkText,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'ابدأ رحلتك التعليمية الآن واشترك مع أفضل المعلمين لتحقيق التفوق.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontFamily: Constant.kFontFamily,
              color: AppColors.greyText,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.push(AppRouter.kSubscribtionToSubject),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              'تصفح المواد',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: Constant.kFontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}