import 'package:darsak/Feature/home/presentation/views/subscribe_material_screen.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/subscribe_button.dart';
import 'package:darsak/constant.dart';
import 'package:darsak/core/extension/string_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SubscribeCard extends StatelessWidget {
  final SubjectNotSubscribe offer;
  final bool isSubscribed;
  final VoidCallback onSubscribe;

  const SubscribeCard({
    super.key,
    required this.offer,
    required this.isSubscribed,
    required this.onSubscribe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: isSubscribed
            ? Border.all(color: AppColors.primaryColor, width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon badge
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: offer.bgColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: SvgPicture.asset(
                offer.svgIcon.toSvg,
                width: 28,
                height: 28,
                colorFilter: ColorFilter.mode(offer.iconColor, BlendMode.srcIn),
              ),
            ),
          ),

          const SizedBox(width: 14),

          // Text block
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + tag row
                Row(
                  children: [
                    Text(
                      offer.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: Constant.kFontFamily,
                        color: AppColors.darkText,
                      ),
                    ),
                    if (offer.tag.isNotEmpty) ...[
                      const SizedBox(width: 8),
                      _Tag(label: offer.tag),
                    ],
                  ],
                ),

                const SizedBox(height: 4),

                Text(
                  offer.description,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: Constant.kFontFamily,
                    color: AppColors.greyText,
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${offer.price} جنية / شهر',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: Constant.kFontFamily,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SubscribeButton(
                      isSubscribed: isSubscribed,
                      onTap: onSubscribe,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String label;
  const _Tag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          fontFamily: Constant.kFontFamily,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
