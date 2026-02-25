import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/views/base/custom_grident_design.dart';
import 'package:flutter_extension/views/base/custom_switch.dart';
import 'package:get/get.dart';

class GroupPermissionScreen extends StatefulWidget {
  const GroupPermissionScreen({super.key});

  @override
  State<GroupPermissionScreen> createState() => _GroupPermissionScreenState();
}

class _GroupPermissionScreenState extends State<GroupPermissionScreen> {
  List<bool> isSwitch = [false, false, false, false, false];

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
                        "Group Permission",
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 13,
                      ),
                      child: Column(
                        children: [
                          Row(
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Kyiv Comic Con",
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "@kyivcomiccon",
                                    style: TextStyle(
                                      color: AppColors.textColor.withValues(
                                        alpha: 0.30,
                                      ),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Color(0xFF1D1D1D),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "What can this admin do?",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF2B80FF),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),

                            decoration: const BoxDecoration(
                              color: Color(0xFF1D1D1D),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Change Group Info",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFCFCFCF),
                                      ),
                                    ),
                                    CustomSwitch(
                                      value: isSwitch[0],
                                      onChanged: (value) {
                                        setState(() {
                                          isSwitch[0] = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Delete Messages",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFCFCFCF),
                                      ),
                                    ),
                                    CustomSwitch(
                                      value: isSwitch[1],
                                      onChanged: (value) {
                                        setState(() {
                                          isSwitch[1] = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Add New Admins",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFCFCFCF),
                                      ),
                                    ),
                                    CustomSwitch(
                                      value: isSwitch[2],
                                      onChanged: (value) {
                                        setState(() {
                                          isSwitch[2] = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Delete Other Admin",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFCFCFCF),
                                      ),
                                    ),
                                    CustomSwitch(
                                      value: isSwitch[3],
                                      onChanged: (value) {
                                        setState(() {
                                          isSwitch[3] = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Delete Channel",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFCFCFCF),
                                      ),
                                    ),
                                    CustomSwitch(
                                      value: isSwitch[4],
                                      onChanged: (value) {
                                        setState(() {
                                          isSwitch[4] = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),

                          Container(
                            width: double.infinity,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFF151053), Color(0xFF1069FF)],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Add admin",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
