import 'package:flutter/material.dart';
import 'package:target_gpa_calculator_pedro/core/utils/styles.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import 'custom_modal_bottom_sheet.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          title: 'Current GPA',
          hint: 'Enter  GPA',
        ),
        CustomTextField(
          title: 'Target GPA',
          hint: 'Enter  GPA',
        ),
        CustomTextField(
          title: 'Desired GPA Hours',
          hint: 'Enter  hours',
        ),
        CustomTextField(
          title: 'Earned Hours',
          hint: 'Enter  hours',
        ),
        SizedBox(
          height: 12,
        ),
        GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  context: context,
                  builder: (context) {
                    return const CustomModalBottomSheet();
                  });
            },
            child: CustomButton())
      ],
    );
  }
}
