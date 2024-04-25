import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CacheNetworkImageWithPlaceholder extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? height;
  final double? width;
  final Duration fadeDuration;
  final BorderRadius borderRadius;
  final Color? color;

  const CacheNetworkImageWithPlaceholder({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.fadeDuration = const Duration(milliseconds: 1),
    this.borderRadius = BorderRadius.zero,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
        fit: fit,
        maxHeightDiskCache: 900,
        maxWidthDiskCache: 675,
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          size: 100,
          color: Colors.red,
        ),
        placeholder: (context, url) {
          return const Text('AT');
        },
      ),
    );
  }
}
