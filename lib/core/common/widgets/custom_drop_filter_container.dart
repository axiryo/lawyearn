import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyearn/core/theme/app_palette.dart';
import 'package:lawyearn/service_locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DropFilterContainer extends StatelessWidget {
  const DropFilterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    SupabaseClient sClient = getIt<SupabaseClient>();
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.2),
                width: 2.5.w,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundColor: AppPallete.whiteColor,
                  child: FittedBox(
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                ),
                Text(
                  sClient.auth.currentSession!.user.id,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
