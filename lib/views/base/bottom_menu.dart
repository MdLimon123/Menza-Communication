import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomMenu extends StatelessWidget {
  final int menuIndex;
  final Function(int) onTap;

  const BottomMenu({super.key, required this.menuIndex, required this.onTap});

  Widget buildItem({
    required String icon,
    required String label,
    required int index,
  }) {
    final bool isSelected = index == menuIndex;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: SvgPicture.asset(
                icon,
                height: 22,
                width: 22,
                colorFilter: ColorFilter.mode(
                  isSelected ? Colors.white : const Color(0xFF464646),
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : const Color(0xFF464646),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF020202),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.20),
            blurRadius: 6,
            spreadRadius: 2,
            offset: const Offset(0, -3),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.17),
            blurRadius: 11,
            offset: const Offset(0, -11),
          ),
        ],
      ),
      child: Row(
        children: [
          buildItem(
            icon: "assets/icon/message.svg",
            label: "Message",
            index: 0,
          ),
          buildItem(
            icon: "assets/icon/search.svg",
            label: "Discovery",
            index: 1,
          ),
          buildItem(icon: "assets/icon/call.svg", label: "Call", index: 2),
          buildItem(
            icon: "assets/icon/settings.svg",
            label: "Settings",
            index: 3,
          ),
        ],
      ),
    );
  }
}
