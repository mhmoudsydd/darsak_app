import 'package:darsak/Feature/auth/presentation/widgets/auth_button.dart';
import 'package:darsak/Feature/auth/presentation/widgets/auth_container_button.dart';
import 'package:darsak/core/extension/context_extension.dart';
import 'package:darsak/core/extension/num_extension.dart';
import 'package:darsak/core/extension/widget_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:darsak/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomContainerAuthWidget extends StatelessWidget {
  const BottomContainerAuthWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: context.pw(1),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            AuthContainerText(),
            Expanded(child: 40.sbh),
    
            AuthButton(
              text: 'تسجيل الدخول باستخدام جوجل',
              icon: 'googleIcon',
              onPressed: () {
                context.push(AppRouter.kHomeScreen);
              },
            ),  20.sbh,
               AuthButton(
              text: 'تسجيل الدخول باستخدام جيت ',
              icon: 'githubIcon',
              onPressed: () {},
              color: Colors.white,
              overlayColor: AppColors.primaryColor,
              textColor: AppColors.primaryColor,
            ),
            100.sbh,
          ],
        ).paddingAll(25),
      ),
    );
  }
}