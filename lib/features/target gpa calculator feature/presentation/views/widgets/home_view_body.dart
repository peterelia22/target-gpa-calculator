import 'package:flutter/material.dart';
import 'package:target_gpa_calculator_pedro/core/models/custom_text_field_model.dart';

import 'custom_snack_bar_with_validator.dart';
import 'custom_text_field_list_view.dart';

class HomeViewBody extends StatelessWidget {
  // Define the list of fields here
  List<CustomTextFieldModel> fields = const [];

  HomeViewBody({super.key})
      : fields = [
          CustomTextFieldModel(
              title: 'Current GPA',
              hint: 'Enter GPA',
              controller: TextEditingController()),
          CustomTextFieldModel(
              title: 'Target GPA',
              hint: 'Enter GPA',
              controller: TextEditingController()),
          CustomTextFieldModel(
              title: 'Desired GPA Hours',
              hint: 'Enter hours',
              controller: TextEditingController()),
          CustomTextFieldModel(
              title: 'Earned Hours',
              hint: 'Enter hours',
              controller: TextEditingController()),
        ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextFieldListView(fields: fields),
          const SizedBox(
            height: 12,
          ),
          CustomSnackBarWithValidator(fields: fields),
        ],
      ),
    );
  }
}
