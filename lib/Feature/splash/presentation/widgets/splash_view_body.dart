import 'package:darsak/Feature/splash/presentation/widgets/graduate_icon.dart';
import 'package:darsak/Feature/splash/presentation/widgets/splash_view_center_icon.dart';
import 'package:darsak/core/extension/num_extension.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
    super.key,
    required this.fadeAnimation,
    required this.slideAnimation,
  });

  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
    
      children: [
        1.sbh,
        FadeTransition(opacity: fadeAnimation,child: SplashViewCenterIcon()),
        SlideTransition(position: slideAnimation,child: GraduateIcon()),
      ],
    );
  }
}