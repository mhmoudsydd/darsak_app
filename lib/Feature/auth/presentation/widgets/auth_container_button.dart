import 'package:darsak/core/extension/num_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AuthContainerText extends StatelessWidget {
  const AuthContainerText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'مرحبًا بعودتك!',
          style: TextStyle(
            fontFamily: 'Harmattan',
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: AppColors.primaryColor,
          ),
        ),
        10.sbh,
        Text(
          'طلب الدخول إلى منصة دروسك',
          style: TextStyle(
            fontFamily: 'Harmattan',
            fontSize: 20,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}