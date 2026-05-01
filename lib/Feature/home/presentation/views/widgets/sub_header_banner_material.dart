import 'package:darsak/Feature/home/presentation/views/widgets/sub_buble_material.dart';
import 'package:darsak/constant.dart';
import 'package:darsak/core/extension/num_extension.dart';
import 'package:flutter/material.dart';

class SubscribeHeaderBanner extends StatelessWidget {
  const SubscribeHeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF3A4FE0), Color(0xFF6C7BF7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -30,
            top: -30,
            child: Buble(size: 160, opacity: 0.08),
          ),
          Positioned(
            left: -20,
            bottom: -40,
            child: Buble(size: 130, opacity: 0.07),
          ),
          // content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                40.sbh,
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.school_rounded,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'وسّع آفاقك التعليمية',
                  style: TextStyle(
                    fontFamily: Constant.kMarFontFamily,
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'اشترك الآن واحصل على أول أسبوع مجانًا',
                  style: TextStyle(
                    fontFamily: Constant.kFontFamily,
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
