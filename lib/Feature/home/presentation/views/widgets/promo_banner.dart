import 'package:darsak/constant.dart';
import 'package:darsak/core/extension/context_extension.dart';
import 'package:darsak/core/extension/num_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  final VoidCallback onTap;
  const PromoBanner({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Container(
        width: context.pw(1),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF4A5FF2), Color(0xFF6C7BF7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withValues(alpha: 0.3),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'إضافة مواد جديدة',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: Constant.kMarFontFamily,
                      color: Colors.white,
                    ),
                  ),
                  6.sbh,
                  Text(
                    'استكشف المواد الجديدة المتاحة الآن',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: Constant.kMarFontFamily,
                      color: Colors.white.withValues(alpha: .85),
                    ),
                  ),
                  14.sbh,
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        'استكشف الآن',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: Constant.kFontFamily,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Illustration
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.school_outlined,
                size: 44,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
