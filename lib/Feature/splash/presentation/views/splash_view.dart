import 'package:darsak/Feature/splash/presentation/widgets/splash_view_body.dart';
import 'package:darsak/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController slideController;
  late AnimationController fadeController;
  late Animation<Offset> slideAnimation;
  late Animation<double> fadeAnimation;
  @override
  void initState() {
    super.initState();
    slideControllerInit();
    fadeControllerInit();
    navWithDelay();
  }

  void navWithDelay() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.push(AppRouter.kAuthView);
      }
    });
  }

  @override
  void dispose() {
    slideController.dispose();
    fadeController.dispose();

    super.dispose();
  }

  void fadeControllerInit() {
    fadeController = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    );

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: fadeController, curve: Curves.easeOut));

    fadeController.forward();
  }

  void slideControllerInit() {
    slideController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),

      end: Offset.zero,
    ).animate(CurvedAnimation(parent: slideController, curve: Curves.easeOut));
    slideController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SplashViewBody(
          fadeAnimation: fadeAnimation,
          slideAnimation: slideAnimation,
        ),
      ),
    );
  }
}
