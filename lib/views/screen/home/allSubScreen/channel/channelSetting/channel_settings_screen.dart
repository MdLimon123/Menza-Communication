import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/views/base/custom_grident_design.dart';
import 'package:flutter_extension/views/screen/home/allSubScreen/channel/channelSetting/channel_image_uplaod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChannelSettingsScreen extends StatefulWidget {
  const ChannelSettingsScreen({super.key});

  @override
  State<ChannelSettingsScreen> createState() => _ChannelSettingsScreenState();
}

class _ChannelSettingsScreenState extends State<ChannelSettingsScreen> {
  String selectedGroupType = 'Public Channel';

  final String description =
      "Biggest Designer Community on Telegram Designer's Space (Hire or Get Hired) #design #telegramdesign #uiux #graphicdesigner #uiuxdesign #uiuxsupply #design #internship";

  List<TextSpan> buildDescriptionWithHashtags(String text) {
    final List<TextSpan> spans = [];
    final words = text.split(' ');

    for (final word in words) {
      if (word.startsWith('#')) {
        spans.add(
          TextSpan(
            text: '$word ',
            style: const TextStyle(
              color: Color(0xFF4A74FF),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      } else {
        spans.add(
          TextSpan(
            text: '$word ',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      }
    }
    return spans;
  }

  void showGroupTypeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return Dialog(
              backgroundColor: const Color(0xFF202020),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Channel Type",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.close, color: Colors.white),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Public Group
                    _buildGroupTypeOption(
                      setDialogState: setDialogState,
                      title: "Public Channel",
                      subtitle:
                          "Public channel can be found in search, anyone can join them",
                      value: "Public Channel",
                    ),

                    const SizedBox(height: 12),

                    // Private Group
                    _buildGroupTypeOption(
                      setDialogState: setDialogState,
                      title: "Private Channel",
                      subtitle:
                          "Private channel can only be join via Invite link...",
                      value: "Private Channel",
                    ),

                    const SizedBox(height: 8),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildGroupTypeOption({
    required StateSetter setDialogState,
    required String title,
    required String subtitle,
    required String value,
  }) {
    return InkWell(
      onTap: () {
        setDialogState(() {});
        setState(() => selectedGroupType = value);
        Navigator.pop(context);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio<String>(
            value: value,
            groupValue: selectedGroupType,
            onChanged: (val) {
              setDialogState(() {});
              setState(() => selectedGroupType = val!);
              Navigator.pop(context);
            },
            activeColor: const Color(0xFF2759FF),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: AppColors.textColor.withValues(alpha: 0.30),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
                        "Channel Permission",
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
                        horizontal: 12,
                        vertical: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.textColor.withValues(
                                      alpha: 0.30,
                                    ),
                                  ),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/nima.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                "Kyiv Comic Con",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textColor,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.all(8),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1D1D1D),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(() => const ChannelImageUplaod());
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icon/attach_fill.svg',
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Upload Profile",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),

                          Container(
                            padding: const EdgeInsets.all(8),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1D1D1D),
                              borderRadius: BorderRadius.circular(8),
                            ),

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Descriptions",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF878787),
                                  ),
                                ),

                                const SizedBox(height: 8),
                                RichText(
                                  text: TextSpan(
                                    children: buildDescriptionWithHashtags(
                                      description,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 4),
                          Text(
                            "you can give an optional description for you channel",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor.withValues(
                                alpha: 0.50,
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xFF000000),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
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

                          const SizedBox(height: 8),

                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xFF000000),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                            child: InkWell(
                              onTap: () => showGroupTypeDialog(),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Channel Type",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFCFCFCF),
                                    ),
                                  ),

                                  Text(
                                    selectedGroupType,
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 11,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFFFF0000,
                              ).withValues(alpha: 0.10),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icon/delete.svg",
                                  color: const Color(0xFFFF3636),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  "Delete This Group",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFFF3636),
                                  ),
                                ),
                              ],
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
