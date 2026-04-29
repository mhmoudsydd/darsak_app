import 'package:darsak/core/extension/num_extension.dart';
import 'package:darsak/core/extension/string_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Color color;
  final String text;
  final String? icon;
  final Color textColor;
  final Color overlayColor;
  final bool isTextButton;
  final double height;

  final void Function() onPressed;
  const AuthButton({
    super.key,
    this.color = AppColors.primaryColor,
    required this.text,
     this.icon,
    required this.onPressed,
    this.height = 8,
    this.textColor = Colors.white,
    this.overlayColor = Colors.white,
    this.isTextButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        overlayColor: overlayColor,
        foregroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.blue.shade400,
        backgroundColor: color,
        padding: EdgeInsets.symmetric(vertical: height),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
                   isTextButton? SizedBox.shrink():Image.asset(icon!.toPng, height: 35),
                             10.sbw,


          Text(
            text,
            style: TextStyle(
              fontFamily: 'Harmattan',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),

        ],
      ),
    );
  }
}
