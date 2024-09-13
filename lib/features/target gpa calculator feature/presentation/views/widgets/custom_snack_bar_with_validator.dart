import 'package:flutter/material.dart';

import '../../../../../core/methods/build_snack_bar.dart';
import '../../../../../core/methods/is_valid_double.dart';
import '../../../../../core/methods/is_valid_int.dart';
import '../../../../../core/models/custom_text_field_model.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'custom_modal_bottom_sheet.dart';

class CustomSnackBarWithValidator extends StatelessWidget {
  const CustomSnackBarWithValidator({
    super.key,
    required this.fields,
  });

  final List<CustomTextFieldModel> fields;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bool isValid = true;

        for (var field in fields) {
          if (field.controller.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              buildSnackBar('Please enter your ${field.title}'),
            );
            isValid = false;
            break;
          }

          if (field.title.contains('GPA') &&
              !isValidDouble(field.controller.text)) {
            ScaffoldMessenger.of(context).showSnackBar(
              buildSnackBar('Invalid ${field.title} value'),
            );
            isValid = false;
            break;
          }

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

          double desiredGpa = ((targetGpa * (earnedHours + desiredHours)) -
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
    );
  }
}
