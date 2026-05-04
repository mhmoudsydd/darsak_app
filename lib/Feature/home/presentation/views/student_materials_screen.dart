import 'package:darsak/Feature/home/presentation/views/home_view.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/material_card.dart';
import 'package:darsak/constant.dart';
import 'package:darsak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StudentMaterialsScreen extends StatelessWidget {
  final List<MaterialItem> materials;

  const StudentMaterialsScreen({super.key, required this.materials});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.darkText),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'موادك الدراسية',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: Constant.kMarFontFamily,
            color: AppColors.darkText,
          ),
        ),
      ),
      body: materials.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.library_books_rounded, size: 60, color: AppColors.greyText.withValues(alpha: 0.3)),
                  const SizedBox(height: 16),
                  Text(
                    'لا يوجد مواد دراسية حتى الآن',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: Constant.kFontFamily,
                      color: AppColors.darkText,
                    ),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: materials.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1.35,
              ),
              itemBuilder: (context, index) => MaterialCard(item: materials[index]),
            ),
    );
  }
}
