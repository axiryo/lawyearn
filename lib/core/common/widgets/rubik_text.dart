import 'package:flutter/cupertino.dart';

class RubikText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;

  const RubikText({
    super.key,
    required this.text,
    this.style,
    this.maxLines,
    this.textOverflow,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style?.copyWith(fontFamily: 'Rubik') ??
          const TextStyle(fontFamily: 'Rubik'),
      overflow: textOverflow,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
