import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: Styles.darkGradient,
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: const Text('Target Gpa Calculator', style: Styles.style28),
            ),
            Expanded(child: HomeViewBody()),
          ],
        ),
      ),
    );
  }
}
