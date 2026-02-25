import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_extension/views/base/custom_grident_design.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UplaodImageScreen extends StatefulWidget {
  const UplaodImageScreen({super.key});

  @override
  State<UplaodImageScreen> createState() => _UplaodImageScreenState();
}

class _UplaodImageScreenState extends State<UplaodImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomGridentDesign(),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.textColor,
                        ),
                      ),
                      const SizedBox(width: 24),

                      Text(
                        "Upload Profile",
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFF141414),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.all(16),
                              height: 241,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/demo.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  'assets/icon/add_icon.svg',
                                  color: Colors.black,
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        CustomButton(onTap: () {}, text: "Submit"),
                      ],
                    ),
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
