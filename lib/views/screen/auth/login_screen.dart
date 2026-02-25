import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/auth_controller.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/images.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_extension/views/base/custom_grident_design.dart';
import 'package:flutter_extension/views/base/custom_selection_button.dart';
import 'package:flutter_extension/views/base/custom_text_field.dart';
import 'package:flutter_extension/views/screen/main/main_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;

  final _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const CustomGridentDesign(),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  // const Spacer(flex: 1),
                  Center(child: Image.asset(Images.appLogo)),
                  const SizedBox(height: 78),
                  Center(
                    child: Text(
                      "Sign In Your Account",
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
                      child: SvgPicture.asset('assets/icon/email.svg'),
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

                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Forget password?",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  CustomButton(
                    onTap: () {
                      Get.to(() => const MainScreen());
                    },
                    text: "Sign In",
                  ),
                  const SizedBox(height: 30),
                  Obx(
                    () => Row(
                      children: [
                        Expanded(
                          child: CustomSelectionButton(
                            id: 'phone',
                            svgIcon: Images.phone,
                            label: 'Phone',
                            isSelected: _authController.isSelected('phone'),
                            onTap: () => _authController.selectOption('phone'),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: CustomSelectionButton(
                            id: 'name',
                            svgIcon: Images.atTheRate,
                            label: 'Name',
                            isSelected: _authController.isSelected('name'),
                            onTap: () => _authController.selectOption('name'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => CustomSelectionButton(
                      id: 'email',
                      svgIcon: Images.email,
                      label: 'E-mail',
                      isSelected: _authController.isSelected('email'),
                      onTap: () => _authController.selectOption('email'),
                    ),
                  ),
                  const SizedBox(height: 58),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.offAllNamed(AppRoutes.signupScreen);
                        },
                        child: Text(
                          "Sign Up",
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

                  //const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
