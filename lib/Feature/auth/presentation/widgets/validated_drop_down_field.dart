import 'package:darsak/core/utils/custom_drop_down_list.dart';
import 'package:flutter/material.dart';

class ValidateCustomDropDownList extends StatelessWidget {
  final String? value;
  final List<DropdownItem> items;
  final String placeholder;
  final void Function(String?) onChanged;
  final String errorMesage;
  final IconData? placeholderIcon;

  const ValidateCustomDropDownList({
    super.key,
    this.value,
    required this.items,
    this.placeholder = 'اختر',
    required this.onChanged,
    required this.errorMesage,
    this.placeholderIcon,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: (value) => value == null || value.isEmpty ? errorMesage : null,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            CustomDropdown(
              value: value,
              placeholderIcon: placeholderIcon,
              items: items,
              placeholder: placeholder,
              onChanged: onChanged,
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 4.0, right: 10.0),
                child: Text(
                  field.errorText!,
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'Harmattan',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    height: 00.5,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}