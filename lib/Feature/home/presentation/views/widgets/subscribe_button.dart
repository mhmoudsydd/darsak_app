import 'package:darsak/constant.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SubscribeButton extends StatelessWidget {
  final bool isSubscribed;
  final VoidCallback onTap;

  const SubscribeButton({
    super.key,
    required this.isSubscribed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: isSubscribed ? const Color(0xFF2ECC71) : AppColors.primaryColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color:
                (isSubscribed
                        ? const Color(0xFF2ECC71)
                        : AppColors.primaryColor)
                    .withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isSubscribed ? null : onTap,
          borderRadius: BorderRadius.circular(25),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isSubscribed ? Icons.check_circle_rounded : Icons.add_rounded,
                  color: Colors.white,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  isSubscribed ? 'قيد الانتظار' : 'طلب اشتراك',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    fontFamily: Constant.kFontFamily,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
