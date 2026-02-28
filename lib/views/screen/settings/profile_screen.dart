import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/views/base/custom_grident_design.dart';
import 'package:flutter_extension/views/base/custom_switch.dart';
import 'package:flutter_extension/views/screen/settings/block_screen.dart';
import 'package:flutter_extension/views/screen/settings/edit_profile_screen.dart';
import 'package:flutter_extension/views/screen/settings/subscription_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool switchValue = false;

  void _showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1A1A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Logout",
                style: TextStyle(
                  color: Color(0xFFFF0000),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Are you sure you want to logout?",
                style: TextStyle(
                  color: AppColors.textColor.withValues(alpha: 0.60),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF0000),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Yes, Logout",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          side: BorderSide(
                            color: AppColors.textColor.withValues(alpha: 0.20),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomGridentDesign(),

          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/call.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),
                Center(
                  child: Text(
                    "Brooklyn Simmons",
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                const Center(
                  child: Text(
                    "@brooklyn_simmons",
                    style: TextStyle(
                      color: Color(0xFFC3C3C3),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF000000),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.textColor.withValues(alpha: (0.10)),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Your Info",
                          style: TextStyle(
                            color: Color(0xFF616161),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),

                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icon/call.svg',
                              color: AppColors.textColor,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "+880 1548 4542",
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "Phone number",
                                  style: TextStyle(
                                    color: AppColors.textColor.withValues(
                                      alpha: (0.30),
                                    ),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icon/at_the_rate.svg',
                              color: AppColors.textColor,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "@brooklynsimmons",
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "Username",
                                  style: TextStyle(
                                    color: AppColors.textColor.withValues(
                                      alpha: (0.30),
                                    ),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icon/email.svg',
                              color: AppColors.textColor,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "@brooklynsimmons",
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "E-mail address",
                                  style: TextStyle(
                                    color: AppColors.textColor.withValues(
                                      alpha: (0.30),
                                    ),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 41),

                        InkWell(
                          onTap: () {
                            Get.to(() => const EditProfileScreen());
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icon/user.svg'),
                              const SizedBox(width: 8),
                              Text(
                                "Edit Profile",
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 21),

                        InkWell(
                          onTap: () {
                            Get.to(() => const BlockScreen());
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icon/user.svg'),
                              const SizedBox(width: 8),
                              Text(
                                "Blocked Users",
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 21),
                        InkWell(
                          onTap: () {
                            Get.to(() => const SubscriptionScreen());
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icon/subscription.svg'),
                              const SizedBox(width: 8),
                              Text(
                                "Subscription",
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 21),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icon/notification.svg'),
                              const SizedBox(width: 8),
                              Text(
                                "Notifications",
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              CustomSwitch(
                                value: switchValue,
                                onChanged: (value) {
                                  setState(() {
                                    switchValue = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 21),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icon/language.svg'),
                              const SizedBox(width: 8),
                              Text(
                                "Language",
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 40),
                        InkWell(
                          onTap: () {
                            _showLogoutBottomSheet(context);
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFFFF0000,
                              ).withValues(alpha: (0.10)),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icon/logout.svg',
                                  color: const Color(0xFFFF0000),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  "Logout",
                                  style: TextStyle(
                                    color: Color(0xFFFF0000),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
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
        ],
      ),
    );
  }
}
