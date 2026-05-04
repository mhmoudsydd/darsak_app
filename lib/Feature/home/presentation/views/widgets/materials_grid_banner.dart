import 'package:darsak/Feature/home/presentation/views/home_view.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/empty_material_banner.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/material_card.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/section_header.dart';
import 'package:flutter/material.dart';

class MaterialsGrid extends StatelessWidget {
  final VoidCallback ontap;
  final List<MaterialItem> materials;
  const MaterialsGrid({super.key, required this.ontap, this.materials = const []});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(ontap: ontap, title: 'موادك الدراسية'),

          const SizedBox(height: 12),

          if (materials.isEmpty)
            const EmptyMaterialsBanner()
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: materials.length == 3
                  ? 2
                  : materials.length > 4
                  ? 4
                  : materials.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1.35,
              ),
              itemBuilder: (context, index) =>
                  MaterialCard(item: materials[index]),
            ),
        ],
      ),
    );
  }
}


