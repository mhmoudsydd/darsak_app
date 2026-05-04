import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerImage extends StatelessWidget {
  final Widget child;
  const ShimmerImage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: [Colors.grey[300]!, Colors.grey[200]!, Colors.grey[300]!],
      ),
      child: child,
    );
  }
}