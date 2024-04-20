import 'package:flutter/material.dart';

class AuthPolicy extends StatelessWidget {
  const AuthPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
            color: Theme.of(context).primaryColor, fontFamily: 'Rubik'),
        children: <TextSpan>[
          const TextSpan(
              text:
                  'By signing up, you are creating a Lawyearn account and agree to Lawyearn\'s '),
          TextSpan(
            text: 'Terms',
            style: TextStyle(color: Theme.of(context).highlightColor),
          ),
          const TextSpan(text: ' and '),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(color: Theme.of(context).highlightColor),
          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }
}
