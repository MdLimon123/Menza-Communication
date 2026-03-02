import 'package:flutter/material.dart';
import 'package:flutter_extension/util/images.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_extension/views/base/custom_grident_design.dart';
import 'package:flutter_extension/views/base/custom_text_field%20copy.dart';
import 'package:flutter_extension/views/screen/auth/login_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomGridentDesign(),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        Center(child: Image.asset(Images.appLogo)),
                        const SizedBox(height: 21),
                        const Center(
                          child: Text(
                            "Reset Password",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF505050),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Center(
                          child: Text(
                            "Reset your account password and access your personal account again",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF878787),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 24),
                        CustomTextField(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: SvgPicture.asset('assets/icon/password.svg'),
                          ),
                          hintText: "| New password",
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: SvgPicture.asset('assets/icon/password.svg'),
                          ),
                          hintText: "| Confirm password",
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  child: CustomButton(
                    onTap: () {
                      Get.to(() => const LoginScreen());
                    },
                    text: "Confirm",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
