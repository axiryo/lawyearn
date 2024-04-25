import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final VoidCallback? onLeadingIconTap;
  final bool? isTitleCentered;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.title = '',
    this.leading,
    this.onLeadingIconTap,
    this.isTitleCentered = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: isTitleCentered,
      leading: GestureDetector(
        onTap: onLeadingIconTap,
        child: leading ??
            IconButton(
              icon: Icon(
                Icons.chevron_left,
                size: 32.sp,
              ),
              onPressed: onLeadingIconTap ?? () => Navigator.of(context).pop(),
            ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
