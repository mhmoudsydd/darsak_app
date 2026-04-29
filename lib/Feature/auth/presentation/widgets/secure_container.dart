import 'package:darsak/core/extension/num_extension.dart';
import 'package:darsak/core/extension/string_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SecureContainer extends StatelessWidget {
  const SecureContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'secureIcon'.toSvg,
            width: 20,
            colorFilter: ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
                        10.sbw,

          Text(
            'تسجيل دخول أمن',
            style: TextStyle(
              fontFamily: 'Harmattan',
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
      
        ],
      ),
    );
  }
}