import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class StudentDataCircleShape extends StatelessWidget {
  const StudentDataCircleShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -120,
      left: -100,
      child: Container(
        width: 320,
        height: 320,
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.15),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}