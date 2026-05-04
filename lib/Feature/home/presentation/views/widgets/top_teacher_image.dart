import 'package:cached_network_image/cached_network_image.dart';
import 'package:darsak/Feature/home/presentation/views/widgets/top_teacher_null_image.dart';
import 'package:darsak/core/extension/context_extension.dart';
import 'package:darsak/core/utils/shimmer_image.dart';
import 'package:flutter/material.dart';

class TopTeacherImage extends StatelessWidget {
  const TopTeacherImage({
    super.key,
    required this.image,
    required this.name,
  });

  final String? image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: image == null
          ? TopTeacherNullImage(name: name)
          : CachedNetworkImage(
              imageUrl: image!,
              fit: BoxFit.cover,
              width: context.pw(0.3),
              height: 120,
              errorWidget: (context, url, error) {
                return TopTeacherNullImage(name: name);
              },
              placeholder: (context, url) {
                return ShimmerImage(
                  child: Container(
                    width: context.pw(0.3),
                    height: 120,
                    color: Colors.grey[300],
                  ),
                );
              },
            ),
    );
  }
}