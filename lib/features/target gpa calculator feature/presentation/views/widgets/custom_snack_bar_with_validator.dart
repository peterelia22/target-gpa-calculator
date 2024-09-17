import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../core/methods/build_snack_bar.dart';
import '../../../../../core/methods/is_valid_double.dart';
import '../../../../../core/methods/is_valid_int.dart';
import '../../../../../core/models/custom_text_field_model.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'custom_modal_bottom_sheet.dart';

class CustomSnackBarWithValidator extends StatefulWidget {
  const CustomSnackBarWithValidator({
    super.key,
    required this.fields,
  });

  final List<CustomTextFieldModel> fields;

  @override
  _CustomSnackBarWithValidatorState createState() =>
      _CustomSnackBarWithValidatorState();
}

class _CustomSnackBarWithValidatorState
    extends State<CustomSnackBarWithValidator> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isLoading
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });

              await Future.delayed(const Duration(milliseconds: 2500));

              bool isValid = true;
              String? errorMessage;

              for (var field in widget.fields) {
                if (field.controller.text.isEmpty) {
                  errorMessage = 'Please enter your ${field.title}';
                  isValid = false;
                  break;
                }

                if (field.title.contains('Target GPA') ||
                    field.title.contains('Current GPA')) {
                  if (!isValidDouble(field.controller.text)) {
                    errorMessage = 'Invalid ${field.title} value';
                    isValid = false;
                    break;
                  } else if (double.parse(field.controller.text) > 4) {
                    errorMessage = '${field.title} cannot be more than 4.0';
                    isValid = false;
                    break;
                  }
                }

                if (field.title.contains('Hours') &&
                    !isValidInt(field.controller.text)) {
                  errorMessage = 'Invalid ${field.title} value';
                  isValid = false;
                  break;
                }
              }

              if (isValid) {
                double currentGpa =
                    double.parse(widget.fields[0].controller.text);
                double targetGpa =
                    double.parse(widget.fields[1].controller.text);
                int desiredHours = int.parse(widget.fields[2].controller.text);
                int earnedHours = int.parse(widget.fields[3].controller.text);

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
                      targetGpa: targetGpa,
                      desiredGpa: desiredGpa,
                    );
                  },
                );
              } else {
                if (errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    buildSnackBar(errorMessage),
                  );
                }
              }

              setState(() {
                _isLoading = false;
              });
            },
      child: _isLoading
          ? LoadingAnimationWidget.stretchedDots(
              size: 38,
              color: Colors.white,
            )
          : const CustomButton(),
    );
  }
}
