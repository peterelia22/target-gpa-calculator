import 'package:flutter/material.dart';

class CustomModalBottomSheet extends StatelessWidget {
  final double desiredGpa;
  const CustomModalBottomSheet({super.key, required this.desiredGpa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("you need gpa = ${desiredGpa.toString()}"),
    );
  }
}
