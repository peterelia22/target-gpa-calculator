import 'package:flutter/material.dart';

class CustomTextFieldModel {
  final String title;
  final String hint;
  final TextEditingController controller;

  const CustomTextFieldModel({
    required this.title,
    required this.hint,
    required this.controller,
  });
}
