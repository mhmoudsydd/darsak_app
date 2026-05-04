import 'package:darsak/Feature/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/latest_courses.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/materials_grid_banner.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/promo_banner.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/subscribed_teachers.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/welcome_section.dart';
import 'package:darsak/core/extension/num_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:darsak/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

const List<MaterialItem> materials = [
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

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(overscroll: false),

      child: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(thereIsFlexSpace: true),
          const SliverToBoxAdapter(child: WelcomeSection()),
          SliverToBoxAdapter(child: 20.sbh),
          SliverToBoxAdapter(
            child: PromoBanner(
              onTap: () => context.push(AppRouter.kSubscribtionToSubject),
            ),
          ),
          SliverToBoxAdapter(child: 24.sbh),
          SliverToBoxAdapter(
            child: MaterialsGrid(
              materials: [],
              ontap: () => context.push(AppRouter.kStudentMaterials, extra: []),
            ),
          ),
          SliverToBoxAdapter(child: 24.sbh),
          const SliverToBoxAdapter(child: SubscribedTeachers()),
          SliverToBoxAdapter(child: 24.sbh),
          const SliverToBoxAdapter(child: LatestCourses()),
          SliverToBoxAdapter(child: 24.sbh),
        ],
      ),
    );
  }
}
