import 'package:flutter/material.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/images.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_extension/views/base/custom_grident_design.dart';
import 'package:flutter_extension/views/base/custom_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isChecked = false;

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
                      "Sign Up Your Account",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: SvgPicture.asset(Images.atTheRate),
                    ),
                    hintText: "| Type user name",
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: SvgPicture.asset(Images.email),
                    ),
                    hintText: "| Phone number or email",
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: SvgPicture.asset('assets/icon/password.svg'),
                    ),
                    hintText: "| Password",
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },

                        side: MaterialStateBorderSide.resolveWith((states) {
                          return const BorderSide(
                            color: Colors.white, // always white
                            width: 1.5,
                          );
                        }),

                        checkColor: Colors.white,
                        activeColor: AppColors.backgroundColor,

                        fillColor: MaterialStateProperty.resolveWith<Color>((
                          states,
                        ) {
                          if (states.contains(MaterialState.selected)) {
                            return AppColors.backgroundColor;
                          }
                          return Colors.transparent;
                        }),
                      ),

                      Text(
                        "Remember me",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  CustomButton(
                    onTap: () {
                      Get.offAllNamed(AppRoutes.emailOrPhoneVerifyScreen);
                    },
                    text: "Sign Up",
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.offAllNamed(AppRoutes.loginScreen);
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
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
