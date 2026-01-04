import 'package:flutter/material.dart';

class CustomTextFormFieldInUserProfile extends StatelessWidget {
  final String labelText;
  final bool isnum;

  final TextEditingController? controller;
  const CustomTextFormFieldInUserProfile({
    super.key,
    this.controller,
    required this.labelText,
    required this.isnum,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: isnum,
      maxLength: 1,
      maxLines: isnum ? 1 : null,
      controller: isnum ? null : controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$labelText cannot be empty';
        }
        return null;
      },
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        labelText: labelText,
        errorText: '$labelText cannot be empty',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
