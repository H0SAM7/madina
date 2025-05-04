import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:madina/core/widgets/custom_loading_indecator.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.image, this.borderRadius, this.aspectRatio,
  });
  final String image;
  final double? aspectRatio;
  final double? borderRadius; 
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius?? 16),
      child: AspectRatio(
        aspectRatio:aspectRatio?? 16 / 9,
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => Icon(Icons.error),
          progressIndicatorBuilder: (context, url, progress) =>
              CustomLoadingIndicator(),
        ),
      ),
    );
  }
}
