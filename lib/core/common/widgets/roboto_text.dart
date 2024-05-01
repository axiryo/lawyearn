import 'package:flutter/cupertino.dart';

class RobotoText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? textOverflow;

  const RobotoText(
      {super.key,
      required this.text,
      this.style,
      this.maxLines,
      this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style?.copyWith(fontFamily: 'Roboto') ??
          const TextStyle(fontFamily: 'Roboto'),
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}
