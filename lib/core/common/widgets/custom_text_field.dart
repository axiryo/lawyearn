import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final FormFieldValidator<String>? validator;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return '$hintText is missing!';
            }
            return null;
          },
      obscureText: isObscureText,
      textInputAction: textInputAction,
    );
  }
}
