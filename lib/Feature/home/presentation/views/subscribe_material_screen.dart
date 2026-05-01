import 'package:darsak/Feature/home/presentation/views/widgets/sub_header_banner_material.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/sub_title_material_chip.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/subscribe_card.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/success_sheet.dart';
import 'package:darsak/constant.dart';
import 'package:darsak/core/extension/context_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ─── Data model ────────────────────────────────────────────────────────────────

class SubjectNotSubscribe {
  final String title;
  final String description;
  final String svgIcon;
  final Color bgColor;
  final Color iconColor;
  final String price;
  final String tag;
  final String teacherPhone;

  const SubjectNotSubscribe({
    required this.title,
    required this.description,
    required this.svgIcon,
    required this.bgColor,
    required this.iconColor,
    required this.price,
    required this.teacherPhone,
    this.tag = '',
  });
}

const subjectsNotSubscribe = <SubjectNotSubscribe>[
  SubjectNotSubscribe(
    title: 'الرياضيات',
    description: '12 درس · أ. محمد السيد · يشمل كل المناهج الثانوية',
    svgIcon: 'math',
    bgColor: Color(0xFFE8ECFF),
    iconColor: AppColors.primaryColor,
    price: '150',
    teacherPhone: '01012345678',
    tag: 'الأكثر طلبًا',
  ),
  SubjectNotSubscribe(
    title: 'الأحياء',
    description: '8 دروس · أ. سارة أحمد · للمرحلة الثانوية',
    svgIcon: 'biology',
    bgColor: Color(0xFFE6F9F1),
    iconColor: Color(0xFF2ECC71),
    price: '120',
    teacherPhone: '01198765432',
  ),
  SubjectNotSubscribe(
    title: 'الفيزياء',
    description: '10 دروس · أ. كريم علي · تشمل تجارب وحلول',
    svgIcon: 'book',
    bgColor: Color(0xFFFFF3E0),
    iconColor: Color(0xFFFF9800),
    price: '130',
    teacherPhone: '01234567890',
    tag: 'جديد',
  ),
  SubjectNotSubscribe(
    title: 'الكيمياء',
    description: '6 دروس · أ. نورا حسن · مراجعات وامتحانات',
    svgIcon: 'book2',
    bgColor: Color(0xFFFCE4EC),
    iconColor: Color(0xFFE91E63),
    price: '110',
    teacherPhone: '01555555555',
  ),
  SubjectNotSubscribe(
    title: 'اللغة الإنجليزية',
    description: '11 درس · أ. ياسمين رضا · محادثة وقواعد',
    svgIcon: 'learning',
    bgColor: Color(0xFFE0F7FA),
    iconColor: Color(0xFF00ACC1),
    price: '140',
    teacherPhone: '01099999999',
    tag: 'جديد',
  ),
];

// ─── Screen ────────────────────────────────────────────────────────────────────

class SubscribeMaterialScreen extends StatefulWidget {
  const SubscribeMaterialScreen({super.key});

  @override
  State<SubscribeMaterialScreen> createState() =>
      _SubscribeMaterialScreenState();
}

class _SubscribeMaterialScreenState extends State<SubscribeMaterialScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final Set<int> _subscribedIndices = {};

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: context.ph(0.259),
            pinned: true,
            backgroundColor: AppColors.primaryColor,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
              onPressed: () => context.pop(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: SubscribeHeaderBanner(),
            ),
            title: Text(
              'اشترك في مادة جديدة',
              style: TextStyle(
                fontFamily: Constant.kMarFontFamily,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),

          // ── Sub-title chip row ──────────────────────────────────────────
          SliverToBoxAdapter(child: SubTitleMaterialChip()),

          // ── Offers list ─────────────────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList.separated(
              separatorBuilder: (_, _) => const SizedBox(height: 14),
              itemCount: subjectsNotSubscribe.length,
              itemBuilder: (context, index) {
                final delay = index * 0.1;
                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    final t = Curves.easeOut.transform(
                      ((_controller.value - delay) / (1 - delay)).clamp(
                        0.0,
                        1.0,
                      ),
                    );
                    return Opacity(
                      opacity: t,
                      child: Transform.translate(
                        offset: Offset(0, 30 * (1 - t)),
                        child: child,
                      ),
                    );
                  },
                  child: SubscribeCard(
                    offer: subjectsNotSubscribe[index],
                    isSubscribed: _subscribedIndices.contains(index),
                    onSubscribe: () {
                      setState(() => _subscribedIndices.add(index));
                      _showSuccessSheet(context, subjectsNotSubscribe[index]);
                    },
                  ),
                );
              },
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }

  // ── Success bottom sheet ─────────────────────────────────────────────────────
  void _showSuccessSheet(BuildContext context, SubjectNotSubscribe subject) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => SuccessSheet(subject: subject),
    );
  }
}


