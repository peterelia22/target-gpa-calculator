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
          Column(
            children: List.generate(fields.length, (index) {
              final field = fields[index];
              return CustomTextField(
                title: field.title,
                hint: field.hint,
                controller: field.controller,
              );
            }),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              bool isValid = true;

              // Validate each field dynamically
              for (var field in fields) {
                if (field.controller.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    buildSnackBar('Please enter your ${field.title}'),
                  );
                  isValid = false;
                  break;
                }

                // Check GPA fields for valid double
                if (field.title.contains('GPA') &&
                    !isValidDouble(field.controller.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    buildSnackBar('Invalid ${field.title} value'),
                  );
                  isValid = false;
                  break;
                }

                // Check hours fields for valid int
                if (field.title.contains('Hours') &&
                    !isValidInt(field.controller.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    buildSnackBar('Invalid ${field.title} value'),
                  );
                  isValid = false;
                  break;
                }
              }

              if (isValid) {
                double currentGpa = double.parse(fields[0].controller.text);
                double targetGpa = double.parse(fields[1].controller.text);
                int desiredHours = int.parse(fields[2].controller.text);
                int earnedHours = int.parse(fields[3].controller.text);

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
