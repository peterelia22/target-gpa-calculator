import 'package:Target_GPA/features/target%20gpa%20calculator%20feature/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TargetGpaApp());
}

class TargetGpaApp extends StatelessWidget {
  const TargetGpaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
