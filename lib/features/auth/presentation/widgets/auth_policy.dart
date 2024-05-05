import 'package:flutter/material.dart';

class AuthPolicy extends StatelessWidget {
  const AuthPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontFamily: 'Rubik',
          color: colorScheme.primary,
        ),
        children: <TextSpan>[
          const TextSpan(
              text:
                  'By signing up, you are creating a Lawyearn account and agree to Lawyearn\'s '),
          TextSpan(
            text: 'Terms',
            style: TextStyle(
              color: colorScheme.secondary,
            ),
          ),
          const TextSpan(text: ' and '),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(
              color: colorScheme.secondary,
            ),
          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }
}
