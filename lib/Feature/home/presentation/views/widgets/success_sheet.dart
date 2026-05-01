import 'package:darsak/Feature/home/presentation/views/subscribe_material_screen.dart';
import 'package:darsak/constant.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SuccessSheet extends StatelessWidget {
  final SubjectNotSubscribe subject;
  const SuccessSheet({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          const SizedBox(height: 24),

          // Success icon
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFFE6F9F1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle_rounded,
              color: Color(0xFF2ECC71),
              size: 40,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            'تم طلب الاشتراك! 🎉',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: Constant.kMarFontFamily,
              color: AppColors.darkText,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'تم طلب الاشتراك في مادة "${subject.title}" بقيمة "${subject.price} جنية"\nيرجي دفع الاشتراك علي رقم الخاص باستاذ المادة او التواصل معاه من خلال هذا الرقم\n${subject.teacherPhone}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontFamily: Constant.kFontFamily,
              color: AppColors.greyText,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 24),

          // CTA
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: Text(
                'حسنا',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: Constant.kMarFontFamily,
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}