import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/images.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_extension/views/base/custom_grident_design.dart';
import 'package:flutter_extension/views/base/custom_text_field%20copy.dart';
import 'package:flutter_extension/views/screen/auth/otp_verify_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomGridentDesign(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Center(child: Image.asset(Images.appLogo)),

                  const SizedBox(height: 78),

                  Center(
                    child: Text(
                      "Find Your Account",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Center(
                    child: Text(
                      "Please enter your email address or mobile number to search for your account.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFBCBCBC),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 24),
                  CustomTextField(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: SvgPicture.asset('assets/icon/email.svg'),
                    ),
                    hintText: "| Phone number or email",
                  ),

                  const SizedBox(height: 32),
                  CustomButton(
                    onTap: () {
                      Get.to(() => const OtpVerifyScreen());
                    },
                    text: "Send",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
