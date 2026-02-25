import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/views/base/custom_grident_design.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PersonDetailsScreen extends StatefulWidget {
  const PersonDetailsScreen({super.key});

  @override
  State<PersonDetailsScreen> createState() => _PersonDetailsScreenState();
}

class _PersonDetailsScreenState extends State<PersonDetailsScreen> {
  int selectedTabIndex = 0;

  // Sample data
  final List<String> mediaItems = [
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
  ];

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

  final List<Map<String, String>> files = [
    {
      'name': 'welcome-document.doc',
      'type': 'DOC',
      'date': '11/02/2025 at 6:32 PM',
      'color': '0xFFE74C3C',
    },
    {
      'name': 'welcome-document.pdf',
      'type': 'PDF',
      'date': '11/02/2025 at 6:32 PM',
      'color': '0xFFE74C3C',
    },
    {
      'name': 'welcome-document.doc',
      'type': 'DOC',
      'date': '11/02/2025 at 6:32 PM',
      'color': '0xFF3498DB',
    },
    {
      'name': 'welcome-document.pdf',
      'type': 'PDF',
      'date': '11/02/2025 at 6:32 PM',
      'color': '0xFFE74C3C',
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

                      PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'mute') {
                          } else if (value == 'search') {
                          } else if (value == 'block') {
                            //  _showBlockConfirmationDialog(context);
                          } else if (value == 'delete') {}
                        },

                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: 'mute',
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/icon/mute.svg'),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Mute',
                                      style: TextStyle(
                                        color: Colors.white.withValues(
                                          alpha: 0.90,
                                        ),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              PopupMenuItem<String>(
                                value: 'search',

                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/icon/search.svg'),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Search',
                                      style: TextStyle(
                                        color: Colors.white.withValues(
                                          alpha: 0.90,
                                        ),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Block Option
                              PopupMenuItem<String>(
                                value: 'block',
                                child: Row(
                                  children: [
                                    SvgPicture.asset("assets/icon/block.svg"),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Block',
                                      style: TextStyle(
                                        color: Colors.white.withValues(
                                          alpha: 0.90,
                                        ),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Delete Conversation Option
                              PopupMenuItem<String>(
                                value: 'delete',
                                child: Row(
                                  children: [
                                    SvgPicture.asset("assets/icon/delete.svg"),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Delete Conversation',
                                      style: TextStyle(
                                        color: Colors.white.withValues(
                                          alpha: 0.90,
                                        ),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],

                        color: const Color(0xFF2C2C2C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        offset: const Offset(0, 40),

                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF3E1A1A),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color(0xFFFFFFFF).withOpacity(0.15),
                                const Color(0xFFFFFFFF).withOpacity(0.0),
                              ],
                            ),
                            border: Border.all(
                              color: const Color(0xFFFFFFFF).withOpacity(0.2),
                              width: 0.5,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                _buildProfileHeader(),

                const SizedBox(height: 12),
                // // Custom Tab Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(child: _buildTab(0, 'Media')),
                      const SizedBox(width: 8),
                      Expanded(child: _buildTab(1, 'Link')),
                      const SizedBox(width: 8),
                      Expanded(child: _buildTab(2, 'File')),
                    ],
                  ),
                ),

                // // Tab Content
                Expanded(
                  child: IndexedStack(
                    index: selectedTabIndex,
                    children: [
                      _buildMediaTab(),
                      _buildLinkTab(),
                      _buildFileTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
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

          // Name
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

          // Username
          Center(
            child: Text(
              '@qmonaminus',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.40),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Last Seen
          Center(
            child: Text(
              'last seen 11/02/2025 at 6:32 PM',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.40),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Phone Number
          Text(
            '+880 123 065646',
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),

          Text(
            "Phone",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textColor.withValues(alpha: 0.40),
              fontWeight: FontWeight.w400,
            ),
          ),

          // Email
          const SizedBox(height: 4),

          Text(
            'qmonaminus@gmail.com',
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "E-mail",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textColor.withValues(alpha: 0.40),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
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
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: 10,
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
