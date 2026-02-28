import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AudioCallScreen extends StatefulWidget {
  const AudioCallScreen({super.key});

  @override
  State<AudioCallScreen> createState() => _AudioCallScreenState();
}

class _AudioCallScreenState extends State<AudioCallScreen> {
  int _seconds = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatDuration(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: Stack(
          children: [
            // Top left - "Audio Calling" label
            // Positioned(
            //   top: MediaQuery.of(context).padding.top + 16,
            //   left: 20,
            //   child: Text(
            //     "Audio Calling",
            //     style: TextStyle(
            //       color: AppColors.textColor.withValues(alpha: 0.6),
            //       fontSize: 12,
            //       fontWeight: FontWeight.w400,
            //     ),
            //   ),
            // ),

            // Center - Avatar, Name, Timer
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/call.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Qmona Minus",
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatDuration(_seconds),
                    style: TextStyle(
                      color: AppColors.textColor.withValues(alpha: 0.6),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            // Bottom control bar
            Positioned(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).padding.bottom + 16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    _buildControlButton(
                      icon: 'assets/icon/video_fill.svg',
                      onTap: () {},
                    ),
                    const SizedBox(width: 10),
                    _buildControlButton(
                      icon: 'assets/icon/mirco_fill.svg',
                      onTap: () {},
                    ),
                    const SizedBox(width: 10),
                    _buildControlButton(
                      icon: 'assets/icon/volume.svg',
                      onTap: () {},
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF2F2F),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          "Call End",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required String icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.textColor.withValues(alpha: 0.10),
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}
