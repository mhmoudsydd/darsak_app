import 'package:darsak/core/extension/context_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.auto_stories_rounded,
      size: context.pw(0.13),
      color: AppColors.primaryColor,
    );
  }
}
