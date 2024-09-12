import 'package:flutter/material.dart';
import 'package:target_gpa_calculator_pedro/core/utils/styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: const Text('Target Gpa Calculator', style: Styles.style28),
      ),
    );
  }
}
