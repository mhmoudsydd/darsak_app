import 'package:darsak/constant.dart';
import 'package:darsak/core/extension/num_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:darsak/core/utils/logo_text.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final bool thereIsFlexSpace;
  const CustomSliverAppBar({super.key, this.thereIsFlexSpace = false});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.backgroundColor,
      stretch: false,
      leadingWidth: 200,
      elevation: 0.0,
      expandedHeight: thereIsFlexSpace ? 150.0 : null,
      pinned: true,
      toolbarHeight: kToolbarHeight, // 56.0, kept explicit for predictable math
      leading: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.auto_stories_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          5.sbw,
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: LogoText(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      flexibleSpace: thereIsFlexSpace
          ? LayoutBuilder(
              builder: (context, constraints) {
                const double expandedHeight = 150.0;

                const double toolbarHeight = kToolbarHeight;
                final double currentHeight = constraints.maxHeight;

                // 0.0 = fully expanded, 1.0 = fully collapsed
                final double collapseRatio =
                    ((expandedHeight - currentHeight) /
                            (expandedHeight - toolbarHeight))
                        .clamp(0.0, 1.0);

                // Fade out between 20% and 80% scroll progress
                final double titleOpacity = (1.0 - (collapseRatio - 0.1) / 0.6)
                    .clamp(0.0, 1.0);

                return Stack(
                  children: [
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Opacity(
                        opacity: titleOpacity,
                        child: Transform.translate(
                          offset: Offset(collapseRatio * 12, collapseRatio * 8),
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                              left: 15,
                              right: 15,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.primaryColor.withValues(
                                alpha: 0.3,
                              ),
                              //TODO: change alpha
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.school_outlined,
                                  color: AppColors.primaryColor,
                                ),
                                2.sbw,
                                Text(
                                  'منصة تعليمية رائدة',
                                  style: TextStyle(
                                    fontFamily: Constant.kFontFamily,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            )
          : null,
    );
  }
}
