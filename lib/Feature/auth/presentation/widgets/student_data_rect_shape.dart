import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class StudentDataRectangelShape extends StatelessWidget {
  const StudentDataRectangelShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -80,
      right: -60,
      child: Transform.rotate(
        angle: 0.3,
        child: Container(
          width: 280,
          height: 280,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }
}