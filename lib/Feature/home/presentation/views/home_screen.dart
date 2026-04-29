import 'package:darsak/Feature/home/presentation/views/test1.dart';
import 'package:darsak/Feature/home/presentation/views/test2.dart';
import 'package:darsak/Feature/home/presentation/views/test3.dart';
import 'package:darsak/core/extension/string_extension.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

// import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

int selected = 0;

List<BottomBarItem> items = [
  BottomBarItem(
    icon: SvgPicture.asset('home'.toSvg, width: 40, height: 30),
    title: const Text('الرئيسية', style: TextStyle(fontFamily: 'Harmattan')),
    selectedColor: AppColors.primaryColor,
  ),
  BottomBarItem(
    icon: SvgPicture.asset('learning'.toSvg, width: 40, height: 30),
    title: const Text('التعلم', style: TextStyle(fontFamily: 'Harmattan')),
    selectedColor: AppColors.primaryColor,
  ),
  BottomBarItem(
    icon: SvgPicture.asset('profile'.toSvg, width: 40, height: 30),
    title: const Text('الاعدادات', style: TextStyle(fontFamily: 'Harmattan')),
    selectedColor: AppColors.primaryColor,
  ),
];
List<Widget> screens = [Test1(), Test2(), Test3()];

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: StylishBottomBar(
        items: items,
        option: AnimatedBarOptions(iconStyle: IconStyle.Default),

        currentIndex: selected,
        onTap: (index) {
          if (index == selected) return;
          // controller.jumpToPage(index);
          setState(() {
            selected = index;
          });
        },
      ),
      body: screens[selected],
    );
  }
}























// class CustomSliverAppBar extends StatelessWidget {
//   const CustomSliverAppBar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       stretch: false,
//       leadingWidth: 200,
//       expandedHeight: 150.0,
//       pinned: true,
//       toolbarHeight: kToolbarHeight, // 56.0, kept explicit for predictable math
//       leading: Row(
//         children: [
//           Container(
//             margin: const EdgeInsets.only(right: 5, top: 5),
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: AppColors.primaryColor,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: const Icon(Icons.school_outlined, color: Colors.white, size: 30),
//           ),
//           const SizedBox(width: 5), // Replaced 5.swb for standard Flutter
//           Text(
//             'دروسك',
//             style: TextStyle(
//               fontSize: 25, 
//               fontWeight: FontWeight.bold,
//               fontFamily: 'Marhey',
//               color: AppColors.primaryColor,
//             ),
//           ),
//         ],
//       ),
//       flexibleSpace: LayoutBuilder(
        
//         builder: (context, constraints) {
//           const double expandedHeight = 150.0;
          
//           const double toolbarHeight = kToolbarHeight;
//           final double currentHeight = constraints.maxHeight;
    
//           // 0.0 = fully expanded, 1.0 = fully collapsed
//           final double collapseRatio = ((expandedHeight - currentHeight) / (expandedHeight - toolbarHeight)).clamp(0.0, 1.0);
    
//           // Fade out between 20% and 80% scroll progress
//           final double titleOpacity = (1.0 - (collapseRatio - 0.1) / 0.6).clamp(0.0, 1.0);
    
//           return Stack(
//             children: [
//               // Optional: background for the flexible space
//               Container(color: Colors.white),
              
//               // Title that fades & slides behind the leading widget
//               Positioned(
//                 bottom: 16,
//                 right: 16,
//                 child: Opacity(
//                   opacity: titleOpacity,
//                   child: Transform.translate(
//                     offset: Offset(collapseRatio * 12, collapseRatio * 8),
//                     child: Container(
                      
//                       padding: const EdgeInsets.only(top: 5, bottom: 5, left: 8, right: 0),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: AppColors.primaryColor.withOpacity(0.3),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                                                     const SizedBox(width: 8),

//                           const Icon(Icons.school_outlined, color: AppColors.primaryColor),
//                           const SizedBox(width: 2),
//                           const Text('منصة تعليمية رائدة'),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
