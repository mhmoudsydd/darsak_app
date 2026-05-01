import 'package:darsak/Feature/auth/presentation/widgets/auth_button.dart';
import 'package:darsak/Feature/auth/presentation/widgets/student_data_header.dart';
import 'package:darsak/Feature/auth/presentation/widgets/student_data_shape.dart';
import 'package:darsak/core/extension/num_extension.dart';
import 'package:darsak/core/utils/app_routes.dart';
import 'package:darsak/core/utils/custom_drop_down_list.dart';
import 'package:darsak/core/utils/custom_text_form_field.dart';
import 'package:darsak/core/utils/imp_lists.dart';
import 'package:darsak/core/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StudentDataView extends StatefulWidget {
  const StudentDataView({super.key});

  @override
  State<StudentDataView> createState() => _StudentDataViewState();
}

class _StudentDataViewState extends State<StudentDataView> {
  final GlobalKey<FormState> studentDataFormKey = GlobalKey<FormState>();
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: studentDataFormKey,
        autovalidateMode: AutovalidateMode.onUserInteractionIfError,

        child: Stack(
          fit: StackFit.expand,
          children: [
            StudentDataShapes(),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      60.sbh,
                      StudnetDataHeader(
                        title: 'استكمال انشاء الحساب',
                        subtitle: 'يرجى إدخال بياناتك للمتابعة',
                      ),
                      20.sbh,
                      CustomTextFormField(
                        labelText: 'الاسم بالكامل',
                        keyboardType: TextInputType.name,
                  
                        validator: (value) {
                          return Validators.validateArabicName(value);
                        },
                      ),
                      20.sbh,
                      CustomTextFormField(
                        labelText: 'رقم هاتف الطالب',
                        keyboardType: TextInputType.phone,
                        isPhoneNumber: true,
                        validator: (value) {
                          return Validators.validatePhoneNumber(value, false);
                        },
                      ),
                      20.sbh,
                  
                      CustomTextFormField(
                        labelText: 'رقم هاتف ولي الأمر',
                        isPhoneNumber: true,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          return Validators.validatePhoneNumber(value, true);
                        },
                      ),
                  
                      20.sbh,
                  
                      FormField<String>(
                        validator: (value) => value == null || value.isEmpty
                            ? 'يرجى اختيار نوع الجنس'
                            : null,
                        builder: (field) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                  
                            children: [
                              CustomDropdown(
                                value: selectedGender,
                                items: gender,
                                placeholderIcon: Icons.person_outline,
                                placeholder: 'اختر نوع جنسك',
                                onChanged: (val) {
                                  setState(() => selectedGender = val);
                                  field.didChange(val); // 👈 Notify FormField
                                },
                              ),
                              if (field.hasError)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4.0,
                                    right: 10.0,
                  
                                  ),
                                  child: Text(
                                    field.errorText!,
                                    style:  TextStyle(
                                color: Colors.red,
                                fontFamily: 'Harmattan',
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                height: 00.5
                              ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                  
                      20.sbh,
                      AuthButton(
                        text: 'متابعة',
                        onPressed: () {
                          if(studentDataFormKey.currentState!.validate()){
                  
                          }
                          context.push(AppRouter.kStudentDataContView);
                        },
                        isTextButton: true,
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
