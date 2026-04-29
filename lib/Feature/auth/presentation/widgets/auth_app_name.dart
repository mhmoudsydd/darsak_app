import 'package:darsak/core/extension/context_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AuthAppName extends StatelessWidget {
  const AuthAppName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
              'دروسك',
              style: TextStyle(
                fontSize: context.pw(0.15),
                fontWeight: FontWeight.bold,
                fontFamily: 'Marhey',
                color:  AppColors.primaryColor,
              ),
            );
  }
}