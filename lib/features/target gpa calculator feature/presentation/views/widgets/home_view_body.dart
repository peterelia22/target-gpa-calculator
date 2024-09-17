import 'package:flutter/material.dart';
import '../../../../../core/models/custom_text_field_model.dart';
import 'custom_snack_bar_with_validator.dart';
import 'custom_text_field_list_view.dart';
import 'share_app.dart';

class HomeViewBody extends StatelessWidget {
  final List<CustomTextFieldModel> fields = [
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
  HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFieldListView(fields: fields),
              const SizedBox(
                height: 12,
              ),
              CustomSnackBarWithValidator(fields: fields),
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: ShareApp(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
