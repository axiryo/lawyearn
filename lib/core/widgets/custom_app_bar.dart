import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData leadingIcon;
  final VoidCallback? onLeadingIconTap;

  const CustomAppBar({
    super.key,
    this.title = '',
    this.leadingIcon = Icons.chevron_left,
    this.onLeadingIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: IconButton(
        icon: Icon(
          leadingIcon,
          size: 32.sp,
        ),
        onPressed: onLeadingIconTap ?? () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
