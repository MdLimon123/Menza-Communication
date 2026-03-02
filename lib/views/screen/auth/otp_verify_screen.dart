import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_extension/controller/auth_controller.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/images.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_extension/views/base/custom_grident_design.dart';
import 'package:flutter_extension/views/screen/auth/reset_password_screen.dart';
import 'package:get/get.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
                      "Verify Your E-mail",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "We have sent the OTP cede to example@gmail.com the process.",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_authController.otpLength, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: 48,
                        height: 56,
                        decoration: BoxDecoration(
                          color: _authController.boxColor(index),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: _authController.focusNodes[index].hasFocus
                                ? Colors.white70
                                : _authController.borderColor(index),
                            width: 1.5,
                          ),
                        ),
                        child: TextField(
                          controller: _authController.controllers[index],
                          focusNode: _authController.focusNodes[index],
                          textAlign: TextAlign.center,

                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: const InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (value) =>
                              _authController.onChanged(value, index),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't received the code? ",
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Resend',
                          style: TextStyle(
                            color: Color(0xFF1BF555),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                  CustomButton(
                    onTap: () {
                      Get.to(() => const ResetPasswordScreen());
                    },
                    text: "Verify",
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
