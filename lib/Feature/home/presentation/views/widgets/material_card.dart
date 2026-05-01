import 'package:darsak/Feature/home/presentation/views/widgets/materials_grid.dart';
import 'package:darsak/constant.dart';
import 'package:darsak/core/extension/num_extension.dart';
import 'package:darsak/core/extension/string_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MaterialCard extends StatelessWidget {
  final MaterialItem item;

  const MaterialCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon badge
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: item.bgColor,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Center(
              child: SvgPicture.asset(
                item.svgIcon.toSvg,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(item.iconColor, BlendMode.srcIn),
              ),
            ),
          ),

          10.sbh,
          // Title
          Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: Constant.kFontFamily,
              color: AppColors.darkText,
            ),
          ),

2.sbh,
          // Subtitle
          Text(
            item.subtitle,
            style: TextStyle(
              fontSize: 12,
              fontFamily: Constant.kFontFamily,
              color: AppColors.greyText,
            ),
          ),
        ],
      ),
    );
  }
}