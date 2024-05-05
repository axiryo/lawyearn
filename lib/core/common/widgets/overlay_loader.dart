import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class OverlayLoader extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const OverlayLoader(
      {super.key, required this.child, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        child,
        if (isLoading)
          Material(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: LoadingAnimationWidget.waveDots(
                color: colorScheme.secondary,
                size: 56.sp,
              ),
            ),
          )
      ],
    );
  }
}
