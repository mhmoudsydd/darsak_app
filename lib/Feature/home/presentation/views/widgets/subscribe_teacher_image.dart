import 'package:cached_network_image/cached_network_image.dart';
import 'package:darsak/core/utils/shimmer_image.dart';
import 'package:flutter/material.dart';

class SubScribeTeacherImage extends StatelessWidget {
  const SubScribeTeacherImage({
    super.key,
    required this.image,
  });

  final String? image;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: CachedNetworkImage(
          imageUrl: image!,
          fit: BoxFit.cover,
                 
          placeholder: (context, url) {
            return ShimmerImage(
              child: Container(
                width: 60,
                height: 60,
                color: Colors.grey[300],
              ),
            );
          },
        ),
      );
  }
}