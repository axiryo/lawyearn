import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lawyearn/core/common/widgets/roboto_text.dart';
import 'package:lawyearn/features/account_settings/presentation/pages/account_settings_page.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? isTitleCentered;
  const HomeAppBar({
    super.key,
    this.isTitleCentered,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const RobotoText(
        text: 'Lawyearn',
      ),
      centerTitle: isTitleCentered,
      actions: [
        IconButton(
          onPressed: () => log('notif clicked'),
          icon: const Badge(child: Icon(Icons.notifications)),
        ),
        IconButton(
          onPressed: () => Navigator.push(context, AccountSettingsPage.route()),
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
