import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/views/base/custom_grident_design.dart';
import 'package:flutter_extension/views/base/custom_text_field.dart';
import 'package:flutter_extension/views/screen/home/allSubScreen/channel/channel_permisson_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddAdminScreen extends StatefulWidget {
  const AddAdminScreen({super.key});

  @override
  State<AddAdminScreen> createState() => _AddAdminScreenState();
}

class _AddAdminScreenState extends State<AddAdminScreen> {
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

                      const SizedBox(width: 8),
                      Text(
                        "Add Admin",
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 16,
                          ),
                          child: CustomTextField(
                            hintText: "Search for people...",
                            filled: true,
                            radius: 40,
                            filColor: const Color(0xFF272727),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                'assets/icon/search.svg',
                                color: AppColors.textColor,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 4,
                          ),
                          color: const Color(0xFF1D1D1D),
                          child: const Text(
                            "Connects in this group",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF616161),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(() => const ChannelPermissonScreen());
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(
                                            0xFFFFFFFF,
                                          ).withValues(alpha: 0.30),
                                        ),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                            'assets/images/simail.png',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Kyiv Comic Con",
                                          style: TextStyle(
                                            color: AppColors.textColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "Last seen Fri 19 Jun, 2020 09:35 am",
                                          style: TextStyle(
                                            color: AppColors.textColor
                                                .withValues(alpha: 0.30),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 15),
                            itemCount: 10,
                          ),
                        ),
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
