import 'package:flutter/material.dart';
import 'package:target_gpa_calculator_pedro/core/models/custom_text_field_model.dart';
import 'package:target_gpa_calculator_pedro/core/utils/styles.dart';

import '../../../../../core/methods/build_snack_bar.dart';
import '../../../../../core/methods/is_valid_double.dart';
import '../../../../../core/methods/is_valid_int.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import 'custom_modal_bottom_sheet.dart';

class HomeViewBody extends StatelessWidget {
  final TextEditingController currentGpaController = TextEditingController();
  final TextEditingController targetGpaController = TextEditingController();
  final TextEditingController desiredHoursController = TextEditingController();
  final TextEditingController earnedHoursController = TextEditingController();
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
          CustomTextField(
            controller: currentGpaController,
            title: 'Current GPA',
            hint: 'Enter GPA',
          ),
          CustomTextField(
            controller: targetGpaController,
            title: 'Target GPA',
            hint: 'Enter GPA',
          ),
          CustomTextField(
            controller: desiredHoursController,
            title: 'Desired GPA Hours',
            hint: 'Enter hours',
          ),
          CustomTextField(
            controller: earnedHoursController,
            title: 'Earned Hours',
            hint: 'Enter hours',
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              bool isValid = true;

              if (currentGpaController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  buildSnackBar('Please enter your Current GPA'),
                );
                isValid = false;
              } else if (!isValidDouble(currentGpaController.text)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  buildSnackBar('Invalid Current GPA value'),
                );
                isValid = false;
              }

              if (targetGpaController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  buildSnackBar('Please enter your Target GPA'),
                );
                isValid = false;
              } else if (!isValidDouble(targetGpaController.text)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  buildSnackBar('Invalid Target GPA value'),
                );
                isValid = false;
              }

              if (desiredHoursController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  buildSnackBar('Please enter Desired GPA Hours'),
                );
                isValid = false;
              } else if (!isValidInt(desiredHoursController.text)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  buildSnackBar('Invalid Desired GPA Hours value'),
                );
                isValid = false;
              }

              if (earnedHoursController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  buildSnackBar('Please enter Earned Hours'),
                );
                isValid = false;
              } else if (!isValidInt(earnedHoursController.text)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  buildSnackBar('Invalid Earned Hours value'),
                );
                isValid = false;
              }

              if (isValid) {
                double currentGpa = double.parse(currentGpaController.text);
                double targetGpa = double.parse(targetGpaController.text);
                int desiredHours = int.parse(desiredHoursController.text);
                int earnedHours = int.parse(earnedHoursController.text);

                double desiredGpa =
                    ((targetGpa * (earnedHours + desiredHours)) -
                            (currentGpa * earnedHours)) /
                        desiredHours;

                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  context: context,
                  builder: (context) {
                    return CustomModalBottomSheet(
                      desiredGpa: desiredGpa,
                    );
                  },
                );
              } else {
                // Optional: Show a SnackBar summarizing that all fields are invalid
                ScaffoldMessenger.of(context).showSnackBar(
                  buildSnackBar('Please fill in all fields correctly.'),
                );
              }
            },
            child: CustomButton(),
          ),
        ],
      ),
    );
  }
}
