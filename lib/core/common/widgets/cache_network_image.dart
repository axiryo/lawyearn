import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CacheNetworkImageWithPlaceholder extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? height;
  final double? width;
  final Duration fadeDuration;
  final BorderRadius borderRadius;
  final Color? color;
  final String? initials;

  const CacheNetworkImageWithPlaceholder({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.fadeDuration = const Duration(milliseconds: 1),
    this.borderRadius = BorderRadius.zero,
    this.color,
    this.initials,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
        fit: fit,
        maxHeightDiskCache: 900,
        maxWidthDiskCache: 675,
        errorWidget: (context, url, error) => Container(
          color: colorScheme.secondaryContainer,
          child: Center(
            child: Text(
              initials!,
              style: TextStyle(
                color: colorScheme.onSecondary,
                fontSize: 48.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
