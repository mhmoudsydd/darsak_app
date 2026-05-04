import 'package:darsak/Feature/home/presentation/views/widgets/top_teacher_image.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/top_teacher_name_subject.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/top_teacher_student_cont.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/top_teacher_student_rate.dart';
import 'package:darsak/core/extension/num_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TopTeacher extends StatelessWidget {
  final String? image;
  final String name;
  final String subject;
  final String rate;
  final String rateCont;
  final String studCont;

  const TopTeacher({
    super.key,
    this.image,
    required this.name,
    required this.subject,
    required this.rate,
    required this.rateCont,
    required this.studCont,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopTeacherImage(image: image, name: name),
          12.sbw,
          SizedBox(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TopTeacherNameAndSubject(name: name, subject: subject),
                8.sbh,

                TopTeacherRate(rate: rate, rateCont: rateCont),
                8.sbh,
                TopTeacherStudentCont(studCont: studCont),
              ],
            ),
          ),
        ],
      ),
    );
  }
}












