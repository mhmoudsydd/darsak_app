import 'package:darsak/Feature/home/presentation/views/widgets/section_header.dart';
import 'package:darsak/core/extension/num_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LatestCourses extends StatelessWidget {
  const LatestCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: "أحدث الإصدارات", ontap: () {}),
          12.sbh,
          _CourseCard(
            title: 'مقدمة في التفاضل والتكامل',
            teacher: 'أ. أحمد محمد',
            lessons: '24 درس',
            duration: '12 ساعة',
            gradientColors: [const Color(0xFF4A5FF2), const Color(0xFF7B8AF9)],
          ),
          const SizedBox(height: 14),
          _CourseCard(
            title: 'أساسيات الفيزياء الحديثة',
            teacher: 'أ. سارة علي',
            lessons: '18 درس',
            duration: '9 ساعات',
            gradientColors: [const Color(0xFF2ECC71), const Color(0xFF6EE7A0)],
          ),
          const SizedBox(height: 14),
          _CourseCard(
            title: 'الكيمياء العضوية',
            teacher: 'أ. محمد خالد',
            lessons: '15 درس',
            duration: '8 ساعات',
            gradientColors: [const Color(0xFFFF9800), const Color(0xFFFFBE4D)],
          ),
        ],
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  final String title;
  final String teacher;
  final String lessons;
  final String duration;
  final List<Color> gradientColors;

  const _CourseCard({
    required this.title,
    required this.teacher,
    required this.lessons,
    required this.duration,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Gradient accent bar
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.play_circle_filled_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(width: 14),
          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Harmattan',
                    color: AppColors.darkText,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  teacher,
                  style: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'Harmattan',
                    color: AppColors.greyText,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    _InfoChip(icon: Icons.menu_book_rounded, label: lessons),
                    const SizedBox(width: 12),
                    _InfoChip(icon: Icons.access_time_rounded, label: duration),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: AppColors.greyText),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Harmattan',
            color: AppColors.greyText,
          ),
        ),
      ],
    );
  }
}
