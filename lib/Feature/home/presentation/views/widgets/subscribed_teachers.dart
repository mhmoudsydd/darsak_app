import 'package:darsak/Feature/home/presentation/views/widgets/section_header.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/teacher_avatar.dart';
import 'package:darsak/core/extension/num_extension.dart';
import 'package:flutter/material.dart';

class SubscribedTeachers extends StatelessWidget {
  const SubscribedTeachers({super.key});

  static const List<Map<String, dynamic>> _teachers = [
    {'name': 'أ. أحمد', 'color': Color(0xFF4A5FF2)},
    {'name': 'أ. سارة', 'color': Color(0xFFE91E63)},
    {'name': 'أ. محمد', 'color': Color(0xFF2ECC71)},
    {'name': 'أ. فاطمة', 'color': Color(0xFFFF9800)},
    {'name': 'أ. خالد', 'color': Color(0xFF9C27B0)},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionHeader(ontap: () {}, title: 'المدرسين المشتركين'),
        ),
        const SizedBox(height: 12),
        // Horizontal list of teachers
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: _teachers.length,
            separatorBuilder: (context, index) => 16.sbw,
            itemBuilder: (context, index) {
              final teacher = _teachers[index];
              return TeacherAvatar(
                name: teacher['name'] as String,
                color: teacher['color'] as Color,
              );
            },
          ),
        ),
      ],
    );
  }
}


