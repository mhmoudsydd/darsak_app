import 'package:darsak/Feature/auth/presentation/widgets/auth_button.dart';
import 'package:darsak/Feature/auth/presentation/widgets/student_data_header.dart';
import 'package:darsak/Feature/auth/presentation/widgets/student_data_shape.dart';
import 'package:darsak/core/extension/num_extension.dart';
import 'package:darsak/core/extension/widget_extension.dart';
import 'package:darsak/core/utils/custom_drop_down_list.dart';
import 'package:darsak/core/utils/imp_lists.dart';
import 'package:flutter/material.dart';

class StudentDataContactView extends StatefulWidget {
  const StudentDataContactView({super.key});

  @override
  State<StudentDataContactView> createState() => _StudentDataContactViewState();
}

class _StudentDataContactViewState extends State<StudentDataContactView> {
  String? selectedStage;
  String? selectedGovern;
  String? selectedSection;
  String? selectedStageEn;
  final GlobalKey<FormState> studentDataFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const StudentDataShapes(),
          SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: studentDataFormKey,
                autovalidateMode: AutovalidateMode.onUserInteractionIfError,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    40.sbh,
                    StudnetDataHeader(
                      title: 'متابعة انشاء الحساب',
                      subtitle: 'بالرجاء ادخال البيانات الخاصة بك للمتابعة',
                    ),
                    20.sbh,
                    // CustomDropdown(
                    //   placeholderIcon: Icons.location_on_outlined,
                    //   value: selectedGovern,
                    //   items: egyptGovernoratesItems,
                    //   placeholder: 'اختر المحافظة',
                    //   onChanged: (val) => setState(() => selectedGovern = val),
                    // ),
                    ValidateCustomDropDownList(
                      placeholderIcon: Icons.location_on_outlined,

                      errorMesage: 'مطلوب اختيار المحافظة',
                      value: selectedGovern,
                      placeholder: 'اختر المحافظة',
                      items: egyptGovernoratesItems,
                      onChanged: (val) => setState(() => selectedGovern = val),
                    ),
                    20.sbh,
                    // CustomDropdown(
                    //   value: selectedStage,
                    //   items: stage,
                    //   placeholder: 'اختر المرحلة الدراسية',
                    //   onChanged: (val) => setState(() {
                    //     selectedStage = val;
                    //     selectedStageEn = stage
                    //         .firstWhere((element) => element.label == val)
                    //         .labelEn;
                    //     selectedSection = null;
                    //   }),
                    // ),
                    ValidateCustomDropDownList(
                      errorMesage: 'مطلوب اختيار المرحلة الدراسية',
                      value: selectedStage,
                      placeholder: 'اختر المرحلة الدراسية',
                      items: stage,
                      onChanged: (val) => setState(() {
                        selectedStage = val;
                        selectedStageEn = stage
                            .firstWhere((element) => element.label == val)
                            .labelEn;
                        selectedSection = null;
                      }),
                    ),
                    20.sbh,
                    if (selectedStage != null)
                      // CustomDropdown(
                      //   value: selectedSection,
                      //   items: section(selectedStageEn!),
                      //   placeholder: 'اختر الشعبة',
                      //   onChanged: (val) => setState(() {
                      //     selectedSection = val;
                      //   }),
                      // ),
                      ValidateCustomDropDownList(
                        errorMesage: 'مطلوب اختيار الشعبة',
                        value: selectedSection,
                        placeholder: 'اختر الشعبة',
                        items: section(selectedStageEn!),
                        onChanged: (val) => setState(() {
                          selectedSection = val;
                        }),
                      ),
                    20.sbh,
                    AuthButton(
                      text: 'إنشاء',
                      onPressed: () {
                        if (studentDataFormKey.currentState!.validate()) {}
                      },
                      isTextButton: true,
                      height: 10,
                    ),
                  ],
                ).paddingAll(25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
              onChanged: (value) {
                onChanged(value);
                field.didChange(value);
              },
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
