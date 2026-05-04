import 'package:darsak/Feature/home/presentation/views/widgets/section_header.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/teacher_avatar.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/top_teacher.dart';
import 'package:darsak/core/extension/num_extension.dart';
import 'package:flutter/material.dart';

class SubscribedTeachers extends StatelessWidget {
  const SubscribedTeachers({super.key});

  static const List<Map<String, dynamic>> subscribedTeacher = [
    // {'name': 'أ. أحمد', 'color': Color(0xFF4A5FF2), 'image': null},
    // {
    //   'name': 'أ. ايمن',
    //   'color': Color(0xFF4A5FF2),
    //   'image':
    //       'https://images.pexels.com/photos/33402136/pexels-photo-33402136.jpeg',
    // },

    // {'name': 'أ. سارة', 'color': Color(0xFFE91E63), 'image': null},
    // {'name': 'أ. محمد', 'color': Color(0xFF2ECC71), 'image': null},
    // {'name': 'أ. فاطمة', 'color': Color(0xFFFF9800), 'image': null},
    // {
    //   'name': 'أ. خالد',
    //   'color': Color(0xFF9C27B0),
    //   'image':
    //       'https://images.pexels.com/photos/33402136/pexels-photo-33402136.jpeg',
    // },
    // {
    //   'name': 'أ. خالد',
    //   'color': Color(0xFF9C27B0),
    //   'image':
    //       'https://images.pexels.com/photos/33402136/pexels-photo-33402136.jpeg',
    // },
  ];
  static const List<Map<String, dynamic>> topTeacher = [
    {
      'name': 'احمد عبدالسلام',
      'subject': 'مادة الرياضيات',
      'rate': '4.5',
      'rateCont': '200',
      'studCont': '300',
      'image': null,
    },
    {
      'name': 'محمد عبدالسلام',
      'subject': 'مادة التفاضل والتكامل',
      'rate': '4.5',
      'rateCont': '200',
      'studCont': '300',
      'image':
          'https://images.pexels.com/photos/33402136/pexels-photo-33402136.jpeg',
    },
    {
      'name': 'ايمن عبدالسلام',
      'subject': 'مادة الفزياء',
      'rate': '2.5',
      'rateCont': '100',
      'studCont': '50',
      'image': null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionHeader(
            showAllIsShow: subscribedTeacher.isNotEmpty ? true : false,
            ontap: () {},
            title: subscribedTeacher.isNotEmpty
                ? 'المدرسين المشتركين'
                : 'أفضل المدرسين',
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: subscribedTeacher.isNotEmpty ? 100 : 160,
          child: ListView.separated(
            physics: subscribedTeacher.isNotEmpty
                ? NeverScrollableScrollPhysics()
                : null,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: subscribedTeacher.isEmpty
                ? topTeacher.length
                : subscribedTeacher.length,
            separatorBuilder: (context, index) => 16.sbw,
            itemBuilder: (context, index) {
              final teacher = subscribedTeacher.isEmpty
                  ? topTeacher[index]
                  : subscribedTeacher[index];
              return subscribedTeacher.isEmpty
                  ? TopTeacher(
                      name: teacher['name'],
                      rateCont: teacher['rateCont'],

                      rate: teacher['rate'],
                      studCont: teacher['studCont'],
                      image: teacher['image'],
                      subject: teacher['subject'],
                    )
                  : TeacherAvatar(
                      name: teacher['name'],
                      color: teacher['color'],
                      image: teacher['image'],
                    );
            },
          ),
        ),
      ],
    );
  }
}
