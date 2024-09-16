import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Styles.style16Medium,
          ),
          const SizedBox(height: 8.0),
          TextField(
            style: const TextStyle(color: Colors.white),
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: Styles.style16Regular,
              filled: true,
              fillColor: const Color(0xff283039),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
        ],
      ),
    );
  }
}
