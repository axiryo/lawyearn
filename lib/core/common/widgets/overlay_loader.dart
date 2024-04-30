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
    return Stack(
      children: [
        child,
        if (isLoading)
          Material(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: LoadingAnimationWidget.stretchedDots(
                color: Theme.of(context).highlightColor,
                size: 56.sp,
              ),
            ),
          )
      ],
    );
  }
}
