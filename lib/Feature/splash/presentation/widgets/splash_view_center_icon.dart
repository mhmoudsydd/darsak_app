import 'package:darsak/core/extension/context_extension.dart';
import 'package:darsak/core/extension/num_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SplashViewCenterIcon extends StatelessWidget {
  const SplashViewCenterIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'دروسك',
          style: TextStyle(
            fontSize: context.pw(0.18),
            fontWeight: FontWeight.bold,
            fontFamily: 'Marhey',
            color:  AppColors.primaryColor,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: context.pw(0.2),
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        12.sbh,
        Text(
          'التعلم الرقمي',
          style: TextStyle(
            fontSize: context.pw(0.05),
            fontWeight: FontWeight.w300,
            fontFamily: "Rakkas",
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}