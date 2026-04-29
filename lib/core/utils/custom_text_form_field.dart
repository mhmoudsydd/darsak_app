import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String? Function(String?) validator;
  final String labelText;
  final TextInputType keyboardType;
  final bool isPhoneNumber;
  const CustomTextFormField({
    super.key,
    required this.validator,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.isPhoneNumber = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.grey,
        fontFamily: 'Harmattan',
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),

      keyboardType: isPhoneNumber ? TextInputType.number : keyboardType,
      cursorColor: AppColors.primaryColor,

      textDirection: TextDirection.rtl,
      inputFormatters: [
        if (isPhoneNumber) FilteringTextInputFormatter.digitsOnly,
        if (isPhoneNumber) LengthLimitingTextInputFormatter(11),
      ],
      validator: validator,

      textAlign: TextAlign.right,

      decoration: InputDecoration(
        prefix: isPhoneNumber
            ? Directionality(

                textDirection:
                    TextDirection.ltr, // Keeps suffix text LTR if needed
                child: const Text(
                  '+20',
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
              )
            : null,
        label: Align(
          alignment: Alignment.centerRight,

          child: Text(
            labelText,
            style: const TextStyle(
              color: Colors.grey,
              fontFamily: 'Harmattan',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        contentPadding: EdgeInsets.only(top: 20, bottom: 10,left:5 ,right: 5),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
          
        ),
        errorStyle:  TextStyle(
              color: Colors.red,
              fontFamily: 'Harmattan',
              fontWeight: FontWeight.bold,
              fontSize: 12,
              height: 00.5
            ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ), // Hides error text space

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
        ),


        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 0),
        ),
      ),
    );
  }
}
