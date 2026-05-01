import 'package:darsak/Feature/home/presentation/views/home_view.dart';
import 'package:darsak/Feature/home/presentation/views/test2.dart';
import 'package:darsak/Feature/home/presentation/views/test3.dart';
import 'package:darsak/constant.dart';
import 'package:darsak/core/extension/string_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

int selected = 0;

List<BottomBarItem> items = [
  BottomBarItem(
    icon: SvgPicture.asset('home'.toSvg, width: 40, height: 28),
    title: Text('الرئيسية', style: TextStyle(fontFamily: Constant.kFontFamily)),
    selectedColor: AppColors.primaryColor,
  ),
  BottomBarItem(
    icon: SvgPicture.asset('learning'.toSvg, width: 40, height: 28),
    title: Text('التعلم', style: TextStyle(fontFamily: Constant.kFontFamily)),
    selectedColor: AppColors.primaryColor,
  ),
  BottomBarItem(
    icon: SvgPicture.asset('profile'.toSvg, width: 40, height: 28),
    title: Text(
      'الاعدادات',
      style: TextStyle(fontFamily: Constant.kFontFamily),
    ),
    selectedColor: AppColors.primaryColor,
  ),
];
List<Widget> screens = [HomeView(), Test2(), Test3()];

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: StylishBottomBar(
        items: items,
        option: AnimatedBarOptions(iconStyle: IconStyle.Default),
        elevation: 1,
        currentIndex: selected,
        onTap: (index) {
          if (index == selected) return;
          setState(() {
            selected = index;
          });
        },
      ),
      body: screens[selected],
    );
  }
}
