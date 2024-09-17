import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _color1Animation;
  late Animation<Color?> _color2Animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2300),
      vsync: this,
    )..repeat(reverse: true);

    _color1Animation = ColorTween(
      begin: Colors.black,
      end: Colors.blue,
    ).animate(_controller);

    _color2Animation = ColorTween(
      begin: const Color.fromARGB(255, 8, 38, 83),
      end: Colors.black,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: 358,
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              colors: [_color1Animation.value!, _color2Animation.value!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Calculate',
                      textAlign: TextAlign.center,
                      style: Styles.style16Bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
