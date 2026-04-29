import 'package:darsak/core/extension/num_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class StudnetDataHeader extends StatelessWidget {
  const StudnetDataHeader({super.key, required this.title, required this.subtitle});
  // final String title = 'استكمال انشاء الحساب';
  // final String subtitle = 'يرجى إدخال بياناتك للمتابعة';
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(  
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
            fontFamily: 'Harmattan',
          ),
        ),
        20.sbh,
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Harmattan',
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}