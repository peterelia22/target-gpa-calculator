import 'package:flutter/material.dart';
import 'package:target_gpa_calculator_pedro/features/target%20gpa%20calculator%20feature/presentation/views/home_view.dart';

void main() {
  runApp(const TargetGpaApp());
}

class TargetGpaApp extends StatelessWidget {
  const TargetGpaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
