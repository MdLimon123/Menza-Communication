import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSelectionButton extends StatelessWidget {
  final String id;
  final String svgIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color activeColor;
  final Color inactiveColor;
  final double iconSize;

  const CustomSelectionButton({
    super.key,
    required this.id,
    required this.svgIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.activeColor = const Color(0xFFFFFFFF),
    this.inactiveColor = Colors.black,
    this.iconSize = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? activeColor : Colors.transparent,
          border: Border.all(
            color: isSelected ? activeColor : inactiveColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SVG Icon
            SvgPicture.asset(
              svgIcon,
              width: iconSize,
              height: iconSize,
              colorFilter: ColorFilter.mode(
                isSelected ? inactiveColor : Colors.white,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? inactiveColor : Colors.white,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
