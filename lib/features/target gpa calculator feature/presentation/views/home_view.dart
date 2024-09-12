import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: const Text(
          'Target Gpa Calculator',
          style: TextStyle(
            color: Color(0xFF0C141C),
            fontSize: 28,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w700,
            height: 0.04,
          ),
        ),
      ),
    );
  }
}
