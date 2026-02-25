import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/views/base/custom_grident_design.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

class GroupDetailsScreen extends StatefulWidget {
  const GroupDetailsScreen({super.key});

  @override
  State<GroupDetailsScreen> createState() => _GroupDetailsScreenState();
}

class _GroupDetailsScreenState extends State<GroupDetailsScreen> {
  int selectedTabIndex = 0;

  final List<Map<String, String>> links = [
    {
      'title': 'Dribbble New Design',
      'url':
          'https://dribbble.com/shots/26388551-Run-Piper-AI-Mock-Up-Template',
    },
    {
      'title': 'Dribbble New Design',
      'url':
          'https://dribbble.com/shots/26388551-Run-Piper-AI-Mock-Up-Template',
    },
    {
      'title': 'Dribbble New Design',
      'url':
          'https://dribbble.com/shots/26388551-Run-Piper-AI-Mock-Up-Template',
    },
  ];

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
                        "Qmona Minus",
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildProfileHeader(),

                        const SizedBox(height: 12),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(child: _buildTab(0, 'Members')),
                              const SizedBox(width: 8),
                              Expanded(child: _buildTab(1, 'Media')),
                              const SizedBox(width: 8),
                              Expanded(child: _buildTab(2, 'Link')),
                              const SizedBox(width: 8),
                              Expanded(child: _buildTab(3, 'File')),
                            ],
                          ),
                        ),

                        _buildTabContent(),
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

  Widget _buildTabContent() {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.4,
      ),
      child: IndexedStack(
        index: selectedTabIndex,
        children: [
          _buildMembersTab(),
          _buildMediaTab(),
          _buildLinkTab(),
          _buildFileTab(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: const BoxDecoration(
        color: Color(0xFF272727),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.40),
                  width: 2,
                ),
                image: const DecorationImage(
                  image: AssetImage("assets/images/nima.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          Center(
            child: Text(
              'Qmona Minus',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 4),

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '@qmonaminus,',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.40),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                Text(
                  '4.543 subscriber',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.40),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3F3F3F),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/icon/message_fill.svg'),
                      Text(
                        "Massage",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),

              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3F3F3F),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/icon/mute_file.svg'),
                      Text(
                        "Mute",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3F3F3F),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/icon/leave.svg'),
                      Text(
                        "Leave",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF353535),
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
                const SizedBox(height: 4),
                Text(
                  "Biggest Designer Community on Telegram Designer's Space (Hire or Get Hired) #design #telegramdesign #uiux #graphicdesigner #uiuxdesign #uiuxsupply #design #internship",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF353535),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icon/add_people.svg'),
                    const SizedBox(width: 8),
                    Text(
                      "Add Members",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Divider(color: Colors.black),
                const SizedBox(height: 4),
                Row(
                  children: [
                    SvgPicture.asset('assets/icon/administrators.svg'),
                    const SizedBox(width: 8),
                    Text(
                      "Administrators",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Divider(color: Colors.black),
                const SizedBox(height: 4),
                Row(
                  children: [
                    SvgPicture.asset('assets/icon/group_settings.svg'),
                    const SizedBox(width: 8),
                    Text(
                      "Group Settings",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMembersTab() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: links.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2C),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFFFFFFF).withValues(alpha: 0.30),
                  ),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/simail.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Qmona Minus",
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "last seen 11/02/2025 at 6:32 PM",
                      style: TextStyle(
                        color: AppColors.textColor.withValues(alpha: 0.30),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTab(int index, String title) {
    final isSelected = selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.textColor.withValues(alpha: 0.20)
              : AppColors.textColor.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white30,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildMediaTab() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: 30,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset("assets/images/dummy.png", fit: BoxFit.cover),
        );
      },
    );
  }

  Widget _buildLinkTab() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: links.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2C),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/link.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      links[index]['title']!,
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      links[index]['url']!,
                      style: const TextStyle(
                        color: Color(0xFF329CFF),
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFileTab() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2C),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/pdf.png'),
                  ),
                ),
              ),

              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "welcome-document.doc",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Uploaded 11/02/2025 at 6:32 PM',
                      style: TextStyle(
                        color: Color(0xFF5C5C5C),
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
