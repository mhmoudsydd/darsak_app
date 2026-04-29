import 'package:darsak/core/extension/context_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class GraduateIcon extends StatelessWidget {
  const GraduateIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.school_outlined,
      size: context.pw(0.13),
      color: AppColors.primaryColor,
    );
  }
}