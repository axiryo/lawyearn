import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final FormFieldValidator<String>? validator;
  final String? hints;
  final bool isOptional;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.validator,
    this.hints,
    this.isOptional = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          keyboardType: textInputType,
          decoration: InputDecoration(
            hintText: hintText,
          ),
          validator: validator ??
              (value) {
                if (!isOptional && (value == null || value.isEmpty)) {
                  return '$hintText is missing!';
                }
                return null;
              },
          obscureText: isObscureText,
          textInputAction: textInputAction,
        ),
        hints != null
            ? Padding(
                padding: EdgeInsets.only(left: 16.sp, top: 4.sp),
                child: Text(
                  hints!,
                  style: TextStyle(color: colorScheme.shadow),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
