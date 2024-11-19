// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hintText, this.textInputType, this.onChanged});
  final String hintText;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      onSubmitted: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: hintText.split(':').first,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
