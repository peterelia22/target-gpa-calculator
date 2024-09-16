// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/models/custom_text_field_model.dart';
import 'custom_snack_bar_with_validator.dart';
import 'custom_text_field_list_view.dart';

class HomeViewBody extends StatelessWidget {
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
              // Padding(
              //   padding: const EdgeInsets.only(top: 20),
              //   child: IconButton(
              //     onPressed: () {},
              //     icon: const Icon(
              //       FontAwesomeIcons.shareFromSquare,
              //       color: Color(0xFF010307),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
