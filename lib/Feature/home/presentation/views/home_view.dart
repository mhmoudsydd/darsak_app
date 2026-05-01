import 'package:darsak/Feature/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/latest_courses.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/materials_grid.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/promo_banner.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/subscribed_teachers.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/welcome_section.dart';
import 'package:darsak/core/extension/num_extension.dart';
import 'package:darsak/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          SliverToBoxAdapter(child: MaterialsGrid(ontap: () {})),
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
