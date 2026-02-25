import 'package:flutter/material.dart';

class CustomGridentDesign extends StatelessWidget {
  const CustomGridentDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF780E00),
                Color(0xFF06061C),
                Color(0xFF06061C),
                Color(0xFF06061C),
              ],
              stops: [0.0, 0.3, 0.65, 1.0],
            ),
          ),
        ),
        Positioned(
          top: -100,
          left: -60,
          child: Container(
            width: 360,
            height: 360,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF780E00).withValues(alpha: 0.45),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        Positioned(
          bottom: -60,
          left: 0,
          right: 0,
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.bottomCenter,
                radius: 1.2,
                colors: [
                  const Color(0xFF780E00).withValues(alpha: 0.08),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
