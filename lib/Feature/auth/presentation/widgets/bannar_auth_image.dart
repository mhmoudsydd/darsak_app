import 'package:darsak/core/extension/context_extension.dart';
import 'package:darsak/core/extension/string_extension.dart';
import 'package:flutter/material.dart';

class BannerAuthImage extends StatelessWidget {
  const BannerAuthImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      height: context.ph(0.23),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: AssetImage('authContainer'.toJpg),

          fit: BoxFit.cover,
        ),
      ),
    );
  }
}