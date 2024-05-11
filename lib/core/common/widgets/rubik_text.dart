import 'package:flutter/cupertino.dart';

class RubikText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? textOverflow;

  const RubikText(
      {super.key,
      required this.text,
      this.style,
      this.maxLines,
      this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style?.copyWith(fontFamily: 'Rubik') ??
          const TextStyle(fontFamily: 'Rubik'),
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}
