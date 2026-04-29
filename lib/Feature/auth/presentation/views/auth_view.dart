import 'package:darsak/Feature/auth/presentation/widgets/auth_app_name.dart';
import 'package:darsak/Feature/auth/presentation/widgets/bannar_auth_image.dart';
import 'package:darsak/Feature/auth/presentation/widgets/bottom_container_auth_widget.dart';
import 'package:darsak/Feature/auth/presentation/widgets/secure_container.dart';
import 'package:darsak/core/extension/num_extension.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffededf2),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BannerAuthImage(),
            SecureContainer(),
            20.sbh,
            AuthAppName(),
            5.sbh,
            BottomContainerAuthWidget(),
          ],
        ),
      ),
    );
  }
}




