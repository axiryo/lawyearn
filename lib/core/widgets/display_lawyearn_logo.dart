import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DisplayLawyearnLogo extends StatelessWidget {
  const DisplayLawyearnLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/lawyearn_alt.svg',
      colorFilter:
          ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
    );
  }
}
