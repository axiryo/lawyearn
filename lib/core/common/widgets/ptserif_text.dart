import 'package:flutter/cupertino.dart';

class PTSerifText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? textOverflow;

  const PTSerifText(
      {super.key,
      required this.text,
      this.style,
      this.maxLines,
      this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style?.copyWith(fontFamily: 'PTSerif') ??
          const TextStyle(fontFamily: 'PTSerif'),
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}
