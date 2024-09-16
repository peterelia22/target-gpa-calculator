import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CustomModalBottomSheet extends StatelessWidget {
  final double desiredGpa;
  final double targetGpa;

  const CustomModalBottomSheet({
    super.key,
    required this.desiredGpa,
    required this.targetGpa,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: Styles.darkGradient),
      width: double.infinity,
      height: desiredGpa < 0
          ? MediaQuery.sizeOf(context).height * 0.2
          : MediaQuery.sizeOf(context).height * 0.36,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          desiredGpa < 0
              ? Text(
                  'The desired GPA cannot be smaller than 0. Please enter a valid GPA.',
                  style: Styles.style16Medium.copyWith(color: Colors.redAccent),
                  textAlign: TextAlign.center,
                )
              : desiredGpa > 4
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Your desired GPA exceeds 4.0, which cannot be achieved in a single semester. Please adjust your target GPA or consider multiple semesters to reach your goal.',
                        style: Styles.style16Medium.copyWith(height: 2),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        'You\'re on track! Your target GPA of ${targetGpa.toStringAsFixed(2)} is achievable with hard work and dedication this semester. To meet your target, you will need to achieve a GPA of ${desiredGpa.toStringAsFixed(2)} this semester. Keep pushing forward!',
                        style: Styles.style16Medium
                            .copyWith(color: Colors.blueAccent, height: 2),
                        textAlign: TextAlign.center,
                      ),
                    ),
          desiredGpa < 0
              ? SizedBox(
                  height: 30,
                )
              : Spacer(),
          MaterialButton(
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Color(0xFF010307),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
