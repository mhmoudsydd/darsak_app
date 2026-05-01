import 'package:darsak/Feature/home/presentation/views/widgets/material_card.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/section_header.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MaterialItem {
  final String title;
  final String subtitle;
  final String svgIcon;
  final Color bgColor;
  final Color iconColor;

  const MaterialItem({
    required this.title,
    required this.subtitle,
    required this.svgIcon,
    required this.bgColor,
    required this.iconColor,
  });
}

const List<MaterialItem> _materials = [
  MaterialItem(
    title: 'الرياضيات',
    subtitle: '12 درس',
    svgIcon: 'math',
    bgColor: Color(0xFFE8ECFF),
    iconColor: AppColors.primaryColor,
  ),
  MaterialItem(
    title: 'الأحياء',
    subtitle: '8 دروس',
    svgIcon: 'biology',
    bgColor: Color(0xFFE6F9F1),
    iconColor: Color(0xFF2ECC71),
  ),
  MaterialItem(
    title: 'الفيزياء',
    subtitle: '10 دروس',
    svgIcon: 'book',
    bgColor: Color(0xFFFFF3E0),
    iconColor: Color(0xFFFF9800),
  ),
  MaterialItem(
    title: 'الكيمياء',
    subtitle: '6 دروس',
    svgIcon: 'book2',
    bgColor: Color(0xFFFCE4EC),
    iconColor: Color(0xFFE91E63),
  ),
  MaterialItem(
    title: 'اللغة العربية',
    subtitle: '9 دروس',
    svgIcon: 'book',
    bgColor: Color(0xFFEDE7F6),
    iconColor: Color(0xFF7C4DFF),
  ),
  MaterialItem(
    title: 'اللغة الإنجليزية',
    subtitle: '11 درس',
    svgIcon: 'learning',
    bgColor: Color(0xFFE0F7FA),
    iconColor: Color(0xFF00ACC1),
  ),
];

class MaterialsGrid extends StatelessWidget {
  final VoidCallback ontap;
  const MaterialsGrid({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(ontap: ontap, title: 'عرض المواد'),

          const SizedBox(height: 12),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _materials.length == 3
                ? 2
                : _materials.length > 4
                ? 4
                : _materials.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 1.35,
            ),
            itemBuilder: (context, index) =>
                MaterialCard(item: _materials[index]),
          ),
        ],
      ),
    );
  }
}
