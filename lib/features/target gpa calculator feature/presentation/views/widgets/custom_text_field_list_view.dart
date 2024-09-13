import 'package:flutter/material.dart';

import '../../../../../core/models/custom_text_field_model.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class CustomTextFieldListView extends StatelessWidget {
  const CustomTextFieldListView({
    super.key,
    required this.fields,
  });

  final List<CustomTextFieldModel> fields;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(fields.length, (index) {
        final field = fields[index];
        return CustomTextField(
          title: field.title,
          hint: field.hint,
          controller: field.controller,
        );
      }),
    );
  }
}
