import 'package:flutter/material.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
            top: -80,
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

          SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, right: 16),
                    child: Text(
                      "As a Guest",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 3),
                Image.asset('assets/images/appLogo.png'),

                const Spacer(flex: 2),

                const Column(
                  children: [
                    Text(
                      'Welcome to Menza',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Sign up or log in to continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                const Spacer(flex: 3),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      CustomButton(
                        onTap: () {
                          Get.offAllNamed(AppRoutes.signupScreen);
                        },
                        text: "Sign Up",
                      ),
                      const SizedBox(height: 12),
                      CustomButton(
                        onTap: () {
                          Get.offAllNamed(AppRoutes.loginScreen);
                        },
                        text: "Sign In",
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
